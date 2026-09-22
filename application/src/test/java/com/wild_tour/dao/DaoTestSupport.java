package com.wild_tour.dao;

import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collections;
import java.util.List;
import java.util.Map;

final class DaoTestSupport {

    private DaoTestSupport() {}

    static Connection fakeConnection(
            final int updateCount,
            final List<Map<String, Object>> rows) {

        return (Connection) Proxy.newProxyInstance(
            Connection.class.getClassLoader(),
            new Class<?>[] { Connection.class },
            (connection, method, args) -> {

                if (method.getName().equals("prepareStatement")) {
                    return fakePreparedStatement(updateCount, rows);
                }

                return defaultValue(method.getReturnType());
            }
        );
    }

    static Connection emptyConnection(int updateCount) {
        return fakeConnection(updateCount, Collections.emptyList());
    }

    private static PreparedStatement fakePreparedStatement(
            final int updateCount,
            final List<Map<String, Object>> rows) {

        return (PreparedStatement) Proxy.newProxyInstance(
            PreparedStatement.class.getClassLoader(),
            new Class<?>[] { PreparedStatement.class },
            (statement, method, args) -> {

                if (method.getName().equals("executeUpdate")) {
                    return updateCount;
                }

                if (method.getName().equals("executeQuery")) {
                    return fakeResultSet(rows);
                }

                return defaultValue(method.getReturnType());
            }
        );
    }

    private static ResultSet fakeResultSet(
            final List<Map<String, Object>> rows) {

        final int[] index = { -1 };

        return (ResultSet) Proxy.newProxyInstance(
            ResultSet.class.getClassLoader(),
            new Class<?>[] { ResultSet.class },
            (resultSet, method, args) -> {

                String name = method.getName();

                if (name.equals("next")) {
                    index[0]++;
                    return index[0] < rows.size();
                }

                if (name.startsWith("get") && args != null && args.length == 1) {
                    Object key = args[0];
                    Object value = null;

                    if (index[0] >= 0 && index[0] < rows.size()) {
                        Map<String, Object> row = rows.get(index[0]);
                        value = key instanceof String
                            ? row.get(key)
                            : row.get("column" + key);
                    }

                    if (name.equals("getInt")) {
                        return value == null ? 0 : ((Number) value).intValue();
                    }

                    if (name.equals("getDouble")) {
                        return value == null ? 0.0 : ((Number) value).doubleValue();
                    }

                    if (name.equals("getLong")) {
                        return value == null ? 0L : ((Number) value).longValue();
                    }

                    if (name.equals("getString")) {
                        return value == null ? null : value.toString();
                    }

                    return value;
                }

                return defaultValue(method.getReturnType());
            }
        );
    }

    private static Object defaultValue(Class<?> type) {
        if (!type.isPrimitive() || type == void.class) {
            return null;
        }

        if (type == boolean.class) return false;
        if (type == byte.class) return (byte) 0;
        if (type == short.class) return (short) 0;
        if (type == int.class) return 0;
        if (type == long.class) return 0L;
        if (type == float.class) return 0.0f;
        if (type == double.class) return 0.0;
        if (type == char.class) return '\0';

        return null;
    }
}
