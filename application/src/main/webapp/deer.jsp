<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title> Deer Gallery</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/>

  <!-- Font Awesome for social icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

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
                  url('https://static.toiimg.com/thumb/msid-100970583,width-1070,height-580,imgsize-73274,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg') center/cover no-repeat;
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
    }

    .modal-content img {
      width: 100%;
      border-radius: 10px;
    }

   

    .social-icons a {
      margin: 0 8px;
      font-size: 22px;
      color: white;
      text-decoration: none;
    }

    .social-icons a:hover {
      color: #f0ad4e;
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
  <h1>Spotted Elegance</h1>
  <p>Explore the beauty of deer</p>
</section>

<!-- Gallery -->
<section class="gallery-section" id="gallery">
  <h2 class="gallery-title">Deer Gallery</h2>
  <div class="gallery-grid">

    <!-- Card 1 -->
    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal"
         data-bs-img="https://images.unsplash.com/photo-1566842144976-d8bbd64b8e55?auto=format&fit=crop&w=1000&q=80">
      <img src="https://static.vecteezy.com/system/resources/previews/054/941/432/non_2x/deer-fawn-with-singed-coat-nestled-in-recovery-enclosure-looking-curious-and-vulnerable-photo.jpg" alt="Deer 1"/>
      <div class="card-caption">Curious Fawn</div>
    </div>

    <!-- Card 2 -->
    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal"
         data-bs-img="https://cdn.pixabay.com/photo/2019/08/28/08/44/animal-4437187_1280.jpg">
      <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgdGP_8TK5FuyO4mikZb4GVLpI2ySye5bY9XV7-LmyghpsrqPRlzsi2j2YknnSFwcb6HrptS8DIgood_7quYGt4XwC8yaO3dv1u_pEWEVLtRVskKus07Nop0k26cfkges2wTsKtH6wkrE/s800/IMG_2723.JPG" alt="Deer 2"/>
      <div class="card-caption">Spotted in the Wild</div>
    </div>

    <!-- Card 3 -->
    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal"
         data-bs-img="https://images.unsplash.com/photo-1508675801662-2757ce0bba2c?auto=format&fit=crop&w=1000&q=80">
      <img src="https://media.istockphoto.com/id/492988518/photo/red-deer-stag-in-the-early-morning-mist.jpg?s=612x612&w=0&k=20&c=tfF_Mo65vGfjKPYolrPORSytd7uLwizKxih2YDNvXaI=" alt="Deer 3"/>
      <div class="card-caption">Stag in the Mist</div>
    </div>

    <!-- Card 4 -->
    <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal"
         data-bs-img="https://cdn.pixabay.com/photo/2022/09/12/13/03/deer-7448514_1280.jpg">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK2VtHOOnDopPs78vRaS21YAzYs0OMCWHvGdEw-Gd8empOydxXkN5oxiPaqM0Q4LsuYP0&usqp=CAU" alt="Deer 4"/>
      <div class="card-caption">In the Glade</div>
    </div>

  </div>
</section>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
    