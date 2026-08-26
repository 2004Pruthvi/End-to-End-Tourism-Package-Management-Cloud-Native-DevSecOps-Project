<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Wildlife Sightings</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>

  <style>
    body {
      background-color: #f4f9f6;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .page-title {
      background-color: #2e7d32;
      color: white;
      padding: 30px;
      border-radius: 15px;
      margin-bottom: 50px;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    }

    .sighting-item {
      display: none;
      opacity: 0;
      transition: opacity 1.5s ease-in-out;
      margin-bottom: 50px;
    }

    .sighting-item.show {
      display: block;
      opacity: 1;
    }

    .sighting-card {
      background: #fff;
      padding: 25px;
      border-radius: 20px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }

    .sighting-card:hover {
      transform: translateY(-5px);
    }

    .sighting-image {
      height: 300px;
      width: 100%;
      object-fit: cover;
      border-radius: 12px;
      opacity: 0;
      transition: opacity 1s ease-in-out;
    }

    .sighting-image.show {
      opacity: 1;
    }

    .sighting-details {
      opacity: 0;
      transition: opacity 1s ease-in-out 0.5s;
    }

    .sighting-details.show {
      opacity: 1;
    }

    .sighting-details h4 {
      color: #006d3a;
      font-size: 1.7rem;
      font-weight: bold;
      margin-bottom: 15px;
    }

    .sighting-details p {
      font-size: 1.1rem;
      line-height: 1.6;
      margin-bottom: 8px;
    }

    a.btn-success {
      margin-top: 10px;
      font-weight: 500;
      border-radius: 8px;
      padding: 10px 20px;
    }

    @media (max-width: 768px) {
      .sighting-image {
        height: 220px;
      }
    }
  </style>
</head>
<body>
   <%@ include file="header.jsp" %>
  <div class="container-fluid bg-success text-white py-4">
    <h1 class="text-center m-0">Wildlife Sightings</h1>
</div>

   
    <div class="container py-5">
    <div id="sighting1" class="sighting-item sighting-card">
      <div class="row align-items-center">
        <div class="col-md-6 mb-3 mb-md-0">
          <img id="image1" class="sighting-image img-fluid"
               src="https://t4.ftcdn.net/jpg/09/74/18/45/360_F_974184522_CWKIQGcWe1duHe1u6AYBIXbF9E792iNf.jpg"
               alt="Indian Elephant" />
        </div>
        <div class="col-md-6 sighting-details">
          <h4>Species: Elephant</h4>
          <p><strong>Date & Time:</strong> April 7, 2025 - 8:30 AM</p>
          <p><strong>Location:</strong> Kabini Wildlife Sanctuary</p>
          <p><strong>Behavior:</strong> Feeding near the riverbank.</p>
          <a href="https://www.google.com/maps?q=12.3482,76.2183" target="_blank" class="btn btn-success">View Map Location</a>
        </div>
      </div>
    </div>

    <!-- Sighting 2 -->
    <div id="sighting2" class="sighting-item sighting-card">
      <div class="row align-items-center">
        <div class="col-md-6 mb-3 mb-md-0">
          <img id="image2" class="sighting-image img-fluid"
               src="https://d22eux7aqicogj.cloudfront.net/assets/blogs/kabini-safari.webp"
               alt="Bengal Tiger" />
        </div>
        <div class="col-md-6 sighting-details">
          <h4>Species: Bengal Tiger</h4>
          <p><strong>Date & Time:</strong> April 6, 2025 - 6:00 AM</p>
          <p><strong>Location:</strong> Kabini Wildlife Sanctuary</p>
          <p><strong>Behavior:</strong> Stalking prey in dense forest.</p>
          <a href="https://www.google.com/maps?q=12.3628,76.1913" target="_blank" class="btn btn-success">View Map Location</a>
        </div>
      </div>
    </div>

    <!-- Sighting 3 -->
    <div id="sighting3" class="sighting-item sighting-card">
      <div class="row">
        <div class="col-md-6">
          <img id="image3" class="sighting-image img-fluid rounded"
               src="https://glitterbyways.com/wp-content/uploads/2021/05/xv8a2770.jpg?w=1024"
               alt="Indian Bison" />
        </div>
        <div class="col-md-6 sighting-details">
          <h4>Species: Bison (Gaur)</h4>
          <p><strong>Date & Time:</strong> April 5, 2025 - 7:15 AM</p>
          <p><strong>Location:</strong> Kabini Wildlife Sanctuary</p>
          <p><strong>Behavior:</strong> The herd was grazing in the early morning mist.</p>
          <a href="https://www.google.com/maps?q=12.3105,76.3087" target="_blank" class="btn btn-success">View Map Location</a>
        </div>
      </div>
    </div>

    <!-- Sighting 4 -->
    <div id="sighting4" class="sighting-item sighting-card">
      <div class="row">
        <div class="col-md-6">
          <img id="image4" class="sighting-image img-fluid rounded"
               src="https://images.moneycontrol.com/static-mcnews/2024/09/20240912064740_1.jpg"
               alt="Black Panther" />
        </div>
        <div class="col-md-6 sighting-details">
          <h4>Species: Black Panther</h4>
          <p><strong>Date & Time:</strong> April 8, 2025 - 5:45 AM</p>
          <p><strong>Location:</strong> Kabini Backwaters Trail</p>
          <p><strong>Behavior:</strong> The elusive black panther was seen stealthily crossing a dirt trail near the backwaters.</p>
          <a href="https://www.google.com/maps?q=12.3070,76.2715" target="_blank" class="btn btn-success">View Map Location</a>
        </div>
      </div>
    </div>

    <!-- Sighting 5 -->
    <div id="sighting5" class="sighting-item sighting-card">
      <div class="row">
        <div class="col-md-6">
          <img id="image5" class="sighting-image img-fluid rounded"
               src="https://assets.simplotel.com/simplotel/image/upload/w_5000,h_3333/x_0,y_260,w_5000,h_2813,r_0,c_crop,q_90,fl_progressive/w_500,f_auto,c_fit/the-serai-kabini/Peacock"
               alt="Peacock in Kabini" />
        </div>
        <div class="col-md-6 sighting-details">
          <h4>Species: Peacock</h4>
          <p><strong>Date & Time:</strong> April 8, 2025 - 9:00 AM</p>
          <p><strong>Location:</strong> Near The Serai, Kabini</p>
          <p><strong>Behavior:</strong> A group of peacocks was observed dancing during an early morning drizzle.</p>
          <a href="https://www.google.com/maps?q=12.3078,76.2812" target="_blank" class="btn btn-success">View Map Location</a>
        </div>
      </div>
    </div>

    <!-- Sighting 6 -->
    <div id="sighting6" class="sighting-item sighting-card">
      <div class="row">
        <div class="col-md-6">
          <img id="image6" class="sighting-image img-fluid rounded"
               src="https://w0.peakpx.com/wallpaper/274/721/HD-wallpaper-wolf-jungle-forest-animal.jpg"
               alt="Wolf in Jungle" />
        </div>
        <div class="col-md-6 sighting-details">
          <h4>Species: Wolf</h4>
          <p><strong>Date & Time:</strong> April 8, 2025 - 6:30 PM</p>
          <p><strong>Location:</strong> Dry Forest Edge, Kabini Zone</p>
          <p><strong>Behavior:</strong> A lone wolf was seen resting under shade, alert and observing the surroundings.</p>
          <a href="https://www.google.com/maps?q=12.2989,76.2257" target="_blank" class="btn btn-success">View Map Location</a>
        </div>
      </div>
    </div>
    <!-- END of Sightings -->
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

  <script>
  document.querySelectorAll('.sighting-item').forEach(item => {
    item.classList.add('show');
    item.querySelector('.sighting-image').classList.add('show');
    item.querySelector('.sighting-details').classList.add('show');
  });
</script>
  
  <%@ include file="footer.jsp" %>
  
</body>
</html>
