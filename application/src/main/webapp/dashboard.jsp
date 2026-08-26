<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wildlife Experience</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        
        .carousel {
            position: relative;
        }
        .carousel-item {
            transition: transform 2s ease-in-out;
        }
        .carousel-item img {
            width: 100%;
            height: 90vh;
            object-fit: cover;
            filter: brightness(60%);
            transition: transform 1s ease-in-out;
        }
        .carousel-item.active img {
            transform: scale(1.1); /* Zoom effect */
        }
        .carousel-caption {
            bottom: 15%;
            left: 10%;
            text-align: left;
        }
        .carousel-caption h1 {
            font-size: 3rem;
            font-weight: bold;
        }
    </style>
</head>
<body>

   <%@ include file="header.jsp" %>

    <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="2000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://redearth.in/blog/wp-content/uploads/2021/03/dsc-1324-1-denoiseai-denoise-1-2000x2801-1.jpeg">
                <div class="carousel-caption">
                    <h1>THE BEST EXPERIENCE <br>OF JOY</h1>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://bsmedia.business-standard.com/_media/bs/img/article/2024-06/04/full/1717494477-7858.jpg">
                <div class="carousel-caption">
                    <h1>EXPLORE WILDLIFE <br>UP CLOSE</h1>
                </div>
            </div>
           <div class="carousel-item">
                <img src="https://www.holidaymonk.com/wp-content/uploads/2022/05/Black-Panther-in-Kabini-Forest-of-India.webp">
                <div class="carousel-caption">
                    <h1>ADVENTURE AWAITS <br>IN THE WILD</h1>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://cdn.prod.website-files.com/65aa483b5ed7ebb96ac699bd/67286ca186705e69a6ef444a_65f043c2529f3eeb65e13f73_chital-kabini.jpeg">
                <div class="carousel-caption">
                    <h1>ADVENTURE AWAITS <br>IN THE WILD</h1>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://cdn.prod.website-files.com/65aa483b5ed7ebb96ac699bd/67286ca186705e69a6ef446a_65f043526343cbb813332585_gaur-male.jpeg">
                <div class="carousel-caption">
                    <h1>ADVENTURE AWAITS <br>IN THE WILD</h1>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="dashboardExtra.jsp" %>
<%@ include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
    