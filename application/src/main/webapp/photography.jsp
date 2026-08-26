<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Kabini Wildlife Photography</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
        }

        /* Hero Section */
        .hero-section {
            background-image: url('https://thrillingtravel.in/wp-content/uploads/2021/01/Zone-B-Kabini.jpg');
            background-size: cover;
            background-position: center;
            height: 60vh;
            color: white;
            text-align: center;
            padding: 80px 20px;
        }

        .hero-section h1 {
            font-size: 3rem;
            font-weight: bold;
        }

        .hero-section p {
            font-size: 1.2rem;
        }


        /* Gallery Section */
        .gallery-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 15px;
            margin: 50px 0;
            padding: 0 20px;
        }

        .gallery-item {
            position: relative;
            overflow: hidden;
            border-radius: 15px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease-in-out;
        }

        .gallery-item:hover img {
            transform: scale(1.1);
        }

        .gallery-item .caption {
            position: absolute;
            bottom: 10px;
            left: 10px;
            color: white;
            font-size: 1.5rem;
            font-weight: bold;
            background-color: rgba(0, 0, 0, 0.6);
            padding: 5px 10px;
            border-radius: 5px;
        }

        
.activity-card {
  display: flex;
  flex-wrap: wrap;
  background-color: #f4f9f4;
  border-radius: 12px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  margin: 20px 0;
  overflow: hidden;
}

.activity-image img {
  width: 100%;
  max-width: 400px;
  object-fit: cover;
  padding-top: 60px;
}

.activity-content {
  padding: 20px;
  flex: 1;
}

.activity-content h2 {
  font-size: 28px;
  color: #2e5e4e;
  margin-bottom: 10px;
}

.activity-content p {
  font-size: 16px;
  color: #444;
  margin: 8px 0;
}

.activity-features {
  list-style: none;
  padding: 0;
  margin: 10px 0;
}

.activity-features li {
  margin-bottom: 6px;
  font-size: 15px;
  color: #333;
}

.activity-details {
  background-color: #e0f2e9;
  padding: 15px;
  border-radius: 8px;
  margin: 15px 0;
}

footer {
    background-color: #343a40;
    width:100%;
    color: white;
    padding: 20px 0;
    margin-top: 50px;
}




    </style>
</head>

<body>
       <%@ include file="header.jsp" %>
    

    <!-- Hero Section -->
    <section class="hero-section" id="hero">
        <h1>Discover the Beauty of Kabini</h1>
        <p>Explore stunning wildlife photography and immerse yourself in the serene landscapes of Kabini.</p>
    </section>



    <!-- Gallery Section -->
    <section id="gallery">
        <div class="container">
            <h2 class="text-center my-5">Wildlife Photography</h2>
            <div class="gallery-container">
                <!-- Gallery Item 1 -->
                <div class="gallery-item">
                 <a href="blackpanther.jsp">
                    <img src="https://mymodernmet.com/wp/wp-content/uploads/2020/07/black-panther-photos-shaaz-jung-2.jpeg"
                        alt="Tiger">
             
                    <div class="caption">Roaming Black Panther</div>
</a>
                </div>
                <!-- Gallery Item 2 -->
                <div class="gallery-item" >
                 <a href="elephant.jsp">
                    <img src="https://www.theoutbackexperience.in/wp-content/uploads/2016/08/12_Elephant_Kabini-Gallery.jpg"
                        alt="Elephant">
                    <div class="caption">Graceful Elephant</div></a>
                </div>
                <!-- Gallery Item 3 -->
                <div class="gallery-item">
                 <a href="deer.jsp">
                    <img src="https://redearth.in/blog/wp-content/uploads/2021/12/chital-kabini-.jpg"
                        alt="Deer">
                    <div class="caption">Elegant Deer</div></a>
                </div>
                <!-- Gallery Item 4 -->
                <div class="gallery-item" >
                 <a href="leopard.jsp">
                    <img src="https://bigcatsindia.com/wp-content/uploads/2019/09/Indian-Leopard-Kabini-Wildlife.jpg"
                        alt="Leopard">
                    <div class="caption">Leopard in Action</div></a>
                </div>
            </div>
        </div>
    </section>

    
    <div class="activity-card">
  <div class="activity-image">
    <img src="https://media.istockphoto.com/id/626056254/photo/clumsy-nature-photographer-dont-find-the-kingfisher-on-the-lens.jpg?s=612x612&w=0&k=20&c=USWn0BxiBMn3BDBdJJPp7DSEyvESXXQqg535lx0K0Cc=" alt="Wildlife Photography">
  </div>
  <div class="activity-content">
    <h2>Wildlife Photography Information</h2>
    <p>Capture the untamed beauty of nature through your lens! Join our guided photo safaris to shoot stunning wildlife, rare birds, and breathtaking landscapes.</p>
    
    <ul class="activity-features">
      <li>📷 Guided photo tours with experts</li>
      <li>🌄 Best zones during golden hours</li>
      <li>🦜 Birdwatching & animal tracking</li>
      <li>📚 Photography tips from professionals</li>
    </ul>

    <div class="activity-details">
      <p><strong>Timings:</strong> 6:00 AM – 9:00 AM & 4:00 PM – 6:30 PM</p>
      <p><strong>Ideal For:</strong> Photographers, Nature Enthusiasts, Birdwatchers</p>
      <p><strong>Pro Tip:</strong> Carry a zoom lens (200mm+), wear earthy tones, and stay patient!</p>
    </div>
<div class="contact-details">
  <p><strong>📞 For more details contact : +91 80456 78901</strong></p>
  
  </div>
</div>
<%@ include file="footer.jsp" %>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    
</body>

</html>