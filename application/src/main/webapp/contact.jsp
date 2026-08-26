<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Wildlife</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }
       
     
        .contact-header {
           background-color: green;
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2.5rem;
            font-weight: bold;
        }
        .map-container {
            position: relative;
        }
        .contact-info {
            background: #f7b500;
            padding: 50px;
            color: white;
            font-weight: bold;
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            width: 500px;
            height: 300px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .contact-form, .contact-info div {
            border-radius: 0;
        }
        .contact-form .form-control {
            border-radius: 0;
        }
        .btn-danger {
            border-radius: 0;
            
        }

    </style>
</head>
<body>
     
       <%@ include file="header.jsp" %>
       
    
    <div class="contact-header">
        CONTACT US
    </div>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12 map-container">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3886.807646478183!2d76.37667801529379!3d12.001515890135058!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3baf691f443abcc1%3A0x168b42f52f5b2d6e!2sKabini%20Forest%20Reserve!5e0!3m2!1sen!2sin!4v1640635202295!5m2!1sen!2sin" width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                <div class="contact-info">
                    <h3>GET IN TOUCH WITH US</h3>
                    <p>📞 92-666-888-0000</p>
                    <p>📧 needhelp@company.com</p>
                    <p>📍 60 Brooklyn Street, Bangalore</p>
                    <div class="bg-white text-dark p-3 mt-3">
                        <h5>Monday - Sunday</h5>
                        <p>9:00 AM to 6:00 PM</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center mt-4">
            <div class="col-md-8 contact-form">
                <h2 class="text-center">HAVE A QUESTION? DROP A LINE</h2>
                <form id="contactForm">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <input type="text" class="form-control" placeholder="Full Name" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <input type="email" class="form-control" placeholder="Email Address" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <input type="text" class="form-control" placeholder="Phone" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <input type="text" class="form-control" placeholder="Subject" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <textarea class="form-control" rows="4" placeholder="Write a message" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-danger w-100" >SUBMIT COMMENT</button>
                </form>
            </div>
        </div>
    </div>


    <script>
        document.getElementById("contactForm").addEventListener("submit", function(event) {
            event.preventDefault();
            alert("Thank you for reaching out! We will get back to you soon.");
            this.reset();
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   
    
</body>
</html>
    