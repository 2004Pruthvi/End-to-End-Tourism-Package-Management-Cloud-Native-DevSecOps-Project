<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Elephant Gallery</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Roboto&display=swap" rel="stylesheet"/>

  <style>
    body {
      background: #fff;
      font-family: 'Roboto', sans-serif;
      color: #333;
    }

    .hero {
      background: linear-gradient(to bottom, rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                  url('https://t4.ftcdn.net/jpg/01/02/18/89/360_F_102188994_UnvrnBpsZ5FZFeIpJmlGFdosr6JZSaJm.jpg') center/cover no-repeat;
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
      color: #3e2f1c;
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
      background: rgba(62, 47, 28, 0.8);
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

    footer {
      background-color: #3e2f1c;
      color: white;
      text-align: center;
      padding: 20px;
      font-size: 0.9rem;
    }
  </style>
</head>
<body>


<!-- Hero -->
<section class="hero">
  <h1>The Gentle Giants</h1>
  <p>Witness the grace and power of Kabini's elephants</p>
</section>

<!-- Gallery -->
<section class="gallery-section" id="gallery">
  <h2 class="gallery-title">Elephant Gallery</h2>
  <div class="gallery-grid">

    <!-- Card 1 -->
    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal"
         data-bs-img="https://images.unsplash.com/photo-1551338041-beb71b040cc7?auto=format&fit=crop&w=1000&q=80">
      <img src="https://redearth.in/blog/wp-content/uploads/2023/03/DSC9675_01.jpg" alt="Elephant 1"/>
      <div class="card-caption">Gentle Giant</div>
    </div>

    <!-- Card 2 -->
    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal"
         data-bs-img="https://images.unsplash.com/photo-1606271869421-c3c13d8b325e?auto=format&fit=crop&w=1000&q=80">
      <img src="https://www.shutterstock.com/image-photo/elephant-drinking-water-kabini-river-260nw-2179229647.jpg" alt="Elephant 2"/>
      <div class="card-caption">River Crossing</div>
    </div>

    <!-- Card 3 -->
    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal"
         data-bs-img="https://images.unsplash.com/photo-1610465297365-4d865130bf2a?auto=format&fit=crop&w=1000&q=80">
      <img src="https://www.wti.org.in/wp-content/uploads/2017/12/feature_vivek-menon_march-of-the-elephants_1.jpg" alt="Elephant 3"/>
      <div class="card-caption">March of the Herd</div>
    </div>

    <!-- Card 4 -->
    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal"
         data-bs-img="https://images.unsplash.com/photo-1572252009284-c0d89002aa58?auto=format&fit=crop&w=1000&q=80">
      <img src="https://t4.ftcdn.net/jpg/09/74/18/45/360_F_974184522_CWKIQGcWe1duHe1u6AYBIXbF9E792iNf.jpg" alt="Elephant 4"/>
      <div class="card-caption">Jungle Explorer</div>
    </div>

  </div>
</section>


</body>
</html>
    