<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Leopard of Kabini</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Roboto&display=swap" rel="stylesheet"/>

  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

  <style>
    body {
      background: #fff;
      font-family: 'Roboto', sans-serif;
      color: #333;
    }

    

    .hero {
      background: linear-gradient(to bottom, rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                  url('https://wildlifesos.org/wp-content/uploads/2023/05/MLRC_UshaNisha.jpg') center/cover no-repeat;
      color: white;
      height: 80vh;
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
      font-size: 1.5rem;
      opacity: 0.85;
    }

    .gallery-section {
      padding: 60px 30px;
    }

    .gallery-title {
      font-size: 2.8rem;
      text-align: center;
      margin-bottom: 40px;
      color: #5e3c1f;
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
      transform: scale(1);
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
      background: rgba(94, 60, 31, 0.8);
      color: white;
      text-align: center;
      padding: 10px;
      font-weight: 600;
      font-size: 1.1rem;
      transition: transform 0.3s ease;
    }

    .modal-content img {
      width: 100%;
      border-radius: 10px;
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
  <h1>The Stealth Stalkers</h1>
  <p>Explore the elusive leopards of Kabini</p>
</section>

<!-- Gallery -->
<section class="gallery-section" id="gallery">
  <h2 class="gallery-title">Leopard Gallery</h2>
  <div class="gallery-grid">

    <!-- Card 1 -->
    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal"
         data-bs-img="https://cdn.pixabay.com/photo/2021/06/15/15/24/leopard-6338455_1280.jpg">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDioR-ZXki93gzT_Q2XMIrVIY5-Sr3Td6Myw&s" alt="Leopard 1"/>
      <div class="card-caption">Tree Watch</div>
    </div>

    <!-- Card 2 -->
    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal"
         data-bs-img="https://cdn.pixabay.com/photo/2017/11/22/22/27/leopard-2970245_1280.jpg">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfqW43DYpEw3XD6v6ffvcEXUfj4sQeEl7pAw&s" alt="Leopard 2"/>
      <div class="card-caption">Spotted Beauty</div>
    </div>

    <!-- Card 3 -->
    <div class="gallery-card" data-bs-toggle="modal" >
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQODJ3mBJYI8OpeuT94jPnbD5IqRrfaKiBhsg&s" alt="Leopard 3"/>
      <div class="card-caption">In the Shadows</div>
    </div>

    <!-- Card 4 -->
    <div class="gallery-card" data-bs-toggle="modal">
      <img src="https://media.istockphoto.com/id/1279091687/photo/indian-wild-male-leopard-or-panther-walking-head-on-with-an-eye-contact-in-natural-green.jpg?s=612x612&w=0&k=20&c=WGP5IxfOZwyQZrMfERiY-9nUM_zkL3mA2NYr5GCfT9A=" alt="Leopard 4"/>
      <div class="card-caption">Jungle Lurker</div>
    </div>

  </div>
</section>

</body>
</html>
    