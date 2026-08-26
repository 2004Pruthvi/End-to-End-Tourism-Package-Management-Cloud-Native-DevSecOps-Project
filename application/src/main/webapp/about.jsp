<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>About Us - Wildlife Tourism</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f9f9f9;
      color: #333;
    }

    /* Header Styling */
    .about-header {
      background: linear-gradient(135deg, #4CAF50, #2e7d32);
      color: white;
      padding: 60px 20px;
      text-align: center;
      border-radius: 0 0 20px 20px;
      margin-bottom: 50px;
    }

    .about-header h1 {
      font-size: 3rem;
      font-weight: 700;
      letter-spacing: 2px;
    }

    .about-header .lead {
      font-size: 1.2rem;
      font-weight: 300;
      margin-top: 15px;
    }

    /* Image Styling */
    .about-img {
      width: 100%;
      height: auto;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      margin-bottom: 40px;
    }

    /* Section Styling */
    .about-section {
      margin-top: 50px;
    }

    .about-text h2 {
      font-size: 2.5rem;
      font-weight: 600;
      color: #333;
      margin-bottom: 20px;
    }

    .about-text p {
      font-size: 1.1rem;
      line-height: 1.8;
      color: #555;
    }

    /* Card Styling for Core Values */
    .values .card {
      background-color: #fff;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease-in-out;
    }

    .values .card:hover {
      transform: translateY(-8px);
    }

    .values h5 {
      font-size: 1.5rem;
      font-weight: 600;
      color: #4CAF50;
    }

    .values p {
      color: #666;
      font-size: 1rem;
      line-height: 1.5;
    }

    /* Extra Section Styling */
    .extra-section {
      background-color: #fff;
      padding: 50px 20px;
      margin-top: 50px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
      border-radius: 15px;
    }

    .extra-section h3 {
      font-size: 2rem;
      font-weight: 600;
      color: #333;
      margin-bottom: 20px;
      padding-left: 30px;
    }
     .extra-section p{
      padding-left: 10px;
     }

    .extra-section ul {
      list-style-type: none;
      padding-left: 30px;
    }

    .extra-section li {
      font-size: 1.1rem;
      color: #555;
      padding: 10px 0;
      display: flex;
      align-items: center;
    }

    .extra-section li::before {
      content: "✔";
      font-size: 1.5rem;
      color: #4CAF50;
      margin-right: 10px;
    }

    /* Footer Styling */
    footer {
      
      margin-top: 50px;
      
    }

    
      .about-text h2 {
        font-size: 2rem;
      }

      .values .card {
        margin-bottom: 30px;
      }
   
  </style>
</head>

<body>
<%@ include file="header.jsp" %>
  <!-- Header -->
  <div class="about-header">
    <h1>About Wildlife Tourism</h1>
    <p class="lead">Connecting travelers with the wonders of nature</p>
  </div>

  <!-- Main Content -->
  <div class="container about-section">
    <div class="row align-items-center g-5">
      <div class="col-lg-6">
        <img src="https://rukminim3.flixcart.com/image/850/1000/xif0q/shopsy-poster/z/g/g/medium-dm-208-wild-animals-poster-forest-animals-poster-jungle-original-imagg49ftfy5swzv.jpeg?q=20&crop=false" alt="Wildlife Tourism" class="about-img">
      </div>
      <div class="col-lg-6 about-text">
        <h2>About Wildlife Tourism</h2>
        <p>
          Wildlife tourism offers an exciting and meaningful way to engage with nature by observing animals in their natural habitats. From safaris to birdwatching and marine life exploration, wildlife tourism gives travelers a chance to witness the beauty of Earth's wildlife in an environmentally responsible manner.
        </p>
        <p>
          This growing sector not only provides unique travel experiences but also helps fund conservation initiatives, supports local communities, and raises awareness about the importance of protecting endangered species and habitats.
        </p>
      </div>
    </div>

    <!-- Core Values of Wildlife Tourism -->
    <div class="row text-center values">
      <div class="col-md-4">
        <div class="card">
          <h5>Conservation Awareness</h5>
          <p>Wildlife tourism supports conservation efforts and helps protect endangered species and ecosystems.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card">
          <h5>Support for Local Communities</h5>
          <p>Tourism revenue creates jobs and supports the local economy, promoting sustainable development.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card">
          <h5>Unique Experiences</h5>
          <p>From safaris to immersive wildlife experiences, wildlife tourism offers life-changing adventures.</p>
        </div>
      </div>
    </div>

    <!-- Extra Sections -->
    <div class="extra-section">
      <div class="row">
        <div class="col-md-6">
          <h3>Importance of Wildlife Tourism</h3>
          <p>
            Wildlife tourism is vital for biodiversity conservation. It generates essential revenue that helps protect natural habitats, supports eco-tourism operators, and educates the public on the importance of sustainable environmental practices. The money generated often goes directly into protecting national parks and reserves, making wildlife tourism a powerful tool for conservation.
          </p>
        </div>
        <div class="col-md-6">
          <h3>Benefits to Tourists</h3>
          <ul>
            <li>Immerse yourself in nature and learn about diverse ecosystems</li>
            <li>Support conservation efforts and sustainable practices</li>
            <li>Experience thrilling wildlife encounters in their natural habitat</li>
            <li>Gain deeper insights into the wildlife, its behaviors, and ecological importance</li>
          </ul>
        </div>
      </div>
    </div>

  </div>
<%@ include file="footer.jsp" %>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    