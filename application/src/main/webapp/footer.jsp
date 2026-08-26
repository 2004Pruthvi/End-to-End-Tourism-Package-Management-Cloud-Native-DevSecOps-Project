<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
    .footer {
        background-color: #0C2340;
        color: white;
        padding: 60px 0;
        font-family: Arial, sans-serif;
    }
    .footer a {
        color: white;
        text-decoration: none;
        font-weight: 400;
    }
    .footer a:hover {
        color: #ccc;
    }
    .social-icons {
        display: flex;
        gap: 12px;
        margin-top: 15px;
    }
    .social-icons a {
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(255, 255, 255, 0.2);
        border-radius: 5px;
        font-size: 20px;
        color: white;
        transition: background 0.3s;
    }
    .social-icons a:hover {
        background: rgba(255, 255, 255, 0.4);
    }
    .gallery img {
        width: 70px;
        height: 70px;
        object-fit: cover;
        margin: 4px;
        border-radius: 5px;
    }
    .footer h5, .footer h4 {
        font-weight: bold;
        margin-bottom: 20px;
    }
    .contact-info p {
        margin: 8px 0;
    }
</style>
</head>
<body>
<footer class="footer text-white">
    <div class="container">
        <div class="row gy-4">
            <!-- Logo & Description -->
            <div class="col-md-3 pe-4">
                <div class="d-flex align-items-center mb-3">
                    <img src="https://tse4.mm.bing.net/th?id=OIP.vNrNrjSGanab468Bks6zNAAAAA&pid=Api&P=0&h=180" alt="Logo" width="50" class="me-2">
                    <h4 class="mb-0">WildLife Tourism</h4>
                </div>
                <p>Wildlife tourism offers travelers the unique opportunity to explore natural habitats, observe wild animals in their environment, and support conservation efforts while enjoying unforgettable adventures.</p>
                <div class="social-icons">
                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                    <a href="#"><i class="fa-brands fa-pinterest"></i></a>
                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                </div>
            </div>

            <!-- Links -->
            <!-- Links -->
<div class="col-md-3">
    <h5 class="ms-5">Links</h5>
    <div class="d-flex flex-column ms-5">
        <a href="about.jsp" class="mb-2">About Us</a>
        <a href="photography.jsp" class="mb-2">Our Gallery</a>
        <a href="safari.jsp" class="mb-2">Safari</a>
        <a href="stay.jsp" class="mb-2">Accommodation</a>
        <a href="packages.jsp" class="mb-2">Wildlife Packages</a>
        <a href="guide.jsp" class="mb-2">Guide Service</a>
        
    </div>
</div>
            

            <!-- Contact Info -->
            <div class="col-md-3">
                <h5>Contact</h5>
                <div class="contact-info">
                    <p><i class="fas fa-phone me-2"></i>666-888-0000</p>
                    <p><i class="fas fa-envelope me-2"></i>needhelp@company.com</p>
                    <p><i class="fas fa-map-marker-alt me-2"></i>66 Brooklyn Golden Street Line, Bangalore</p>
                </div>
            </div>

            <!-- Gallery -->
            <div class="col-md-3">
                <h5>Gallery</h5>
                <div class="gallery d-flex flex-wrap">
                    <img src="https://images.pexels.com/photos/3777200/pexels-photo-3777200.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" alt="img1">
                    <img src="https://t4.ftcdn.net/jpg/02/75/68/23/360_F_275682379_DGTncKA0ydnvu2epbLmWVhsFGPrQ7uwA.jpg" alt="img2">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoeDUQNwoG1LMyx32vZ2uwhXERU0XhvWsOJw&s" alt="img3">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSbl9sxBhiIuk4axoNdWQlqqVShhqd774Ctw&s" alt="img4">
                    <img src="https://img.freepik.com/free-photo/closeup-shot-beautiful-african-elephant_181624-13558.jpg" alt="img5">
                    <img src="https://t4.ftcdn.net/jpg/04/59/68/91/360_F_459689140_SF4G5fizLpJhhy8pu93rQk53PL43EwVd.jpg" alt="img6">
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap JS Bundle -->
</body>
</html>
