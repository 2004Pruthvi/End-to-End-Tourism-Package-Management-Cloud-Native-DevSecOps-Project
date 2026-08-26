<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content="Explore the rare and majestic Black Panther of Kabini through this immersive wildlife gallery." />
  <title>Kabini Black Panther Gallery</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Roboto&display=swap" rel="stylesheet"/>

  <style>
    body {
      background: #fff;
      font-family: 'Roboto', sans-serif;
      color: #333;
      margin: 0;
      padding: 0;
    }

    .hero {
      background: linear-gradient(to bottom, rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
                  url('https://sanctuarynaturefoundation.org/public/uploads/Article/1571827774332_Black_panther_kabini_thomas_rajan_1920.jpg') center/cover no-repeat;
      color: white;
      height: 70vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      animation: fadeIn 2s ease-in;
    }

    .hero h1 {
      font-size: 4rem;
      font-family: 'Playfair Display', serif;
      animation: slideIn 1.5s ease-out;
    }

    .hero p {
      font-size: 1.4rem;
      opacity: 0.9;
    }

    .gallery-section {
      padding: 60px 30px;
    }

    .gallery-title {
      font-size: 2.8rem;
      text-align: center;
      margin-bottom: 40px;
      color: #1b3b1b;
      font-family: 'Playfair Display', serif;
    }

    .gallery-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      gap: 25px;
      animation: fadeIn 1.5s ease-in-out;
    }

    .gallery-card {
      position: relative;
      overflow: hidden;
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
      cursor: pointer;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .gallery-card img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.4s ease;
    }

    .gallery-card:hover {
      transform: scale(1.03);
      box-shadow: 0 12px 25px rgba(0, 0, 0, 0.25);
    }

    .gallery-card:hover img {
      transform: scale(1.1);
    }

    .card-caption {
      position: absolute;
      bottom: 0;
      width: 100%;
      background: rgba(27, 59, 27, 0.85);
      color: white;
      text-align: center;
      padding: 10px;
      font-weight: 600;
      font-size: 1.1rem;
      transition: all 0.3s ease-in-out;
    }

    .gallery-card:hover .card-caption {
      transform: translateY(-5px);
    }

    .modal-content img {
      width: 100%;
      border-radius: 10px;
      opacity: 0;
      transition: opacity 0.5s ease;
    }

    .modal-content img.loaded {
      opacity: 1;
    }

    .modal-header {
      border-bottom: none;
    }

    @keyframes fadeIn {
      0% { opacity: 0; transform: translateY(20px); }
      100% { opacity: 1; transform: translateY(0); }
    }

    @keyframes slideIn {
      0% { transform: translateY(-50px); opacity: 0; }
      100% { transform: translateY(0); opacity: 1; }
    }

    

  </style>
</head>
<body>

<!-- Hero -->
<section class="hero">
  <h1>The Black Panther</h1>
  <p>Explore the elusive beauty of Kabini's majestic predator</p>
</section>

<!-- Gallery -->
<section class="gallery-section" id="gallery">
  <h2 class="gallery-title">Wildlife Gallery</h2>
  <div class="gallery-grid">

    <!-- Gallery Cards -->
    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal" data-bs-img="https://images.unsplash.com/photo-1581260234764-13c3d1c33d9b?auto=format&fit=crop&w=1000&q=80">
      <img loading="lazy" src="https://im.whatshot.in/img/2020/Jul/is-2-1594273582.jpg" alt="Black Panther in Forest"/>
      <div class="card-caption">Forest Gaze</div>
    </div>

    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal" data-bs-img="https://images.unsplash.com/photo-1612036780551-0e4c42b38b26?auto=format&fit=crop&w=1000&q=80">
      <img loading="lazy" src="https://im.indiatimes.in/photogallery/2020/Jul/5_5f15656099eea.jpg" alt="Black Panther in Shadows"/>
      <div class="card-caption">Stealth in Shadows</div>
    </div>

    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal" data-bs-img="https://images.unsplash.com/photo-1611828042084-05f760dd7a1e?auto=format&fit=crop&w=1000&q=80">
      <img loading="lazy" src="https://i.pinimg.com/736x/3e/91/0b/3e910bf5ca92ac1ebab74441c905bb86.jpg" alt="Black Panther Walking"/>
      <div class="card-caption">Jungle Walk</div>
    </div>

    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal" data-bs-img="https://images.unsplash.com/photo-1596222075293-52502b3b2dbb?auto=format&fit=crop&w=1000&q=80">
      <img loading="lazy" src="https://im.whatshot.in/img/2020/Jul/is-1-1594273535.jpg" alt="Black Panther Silent Prowler"/>
      <div class="card-caption">The Silent Prowler</div>
    </div>

  </div>
</section>


</body>
</html>
    