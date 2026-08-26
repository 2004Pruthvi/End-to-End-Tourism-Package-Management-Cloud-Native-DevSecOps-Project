<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Wildlife Experience</title>

  <!-- Bootstrap CSS 5.3.2 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
   body {
  font-family: 'Poppins', Arial, sans-serif;
}


    
    /* INFO SECTION (Merged Part) */
    

    
  .hero-section {
      padding: 60px 0;
      position: relative;
      overflow: hidden;
    }

    .hero-img {
      width: 100%;
      border-radius: 50%;
      object-fit: cover;
      aspect-ratio: 1/1;
    }

    .icon-overlay {
      position: absolute;
      bottom: 40px;
      right: 20px;
      background: #fac539;
      color: white;
      font-size: 30px;
      padding: 20px;
      border-radius: 50%;
    }

    .hero-title {
      font-size: 42px;
      font-weight: 900;
      color: #0d0d24;
      line-height: 1.2;
    }

    .hero-highlight {
      color: #fc4c2f;
      font-size: 18px;
      margin-top: 20px;
      font-weight: 600;
    }

    .hero-text {
      color: #8c8c8c;
      margin: 20px 0;
      line-height: 1.6;
    }

    .hero-list li {
      margin-bottom: 10px;
      font-weight: 500;
      color: #0d0d24;
    }

    .hero-list i {
      color: #fac539;
      margin-right: 10px;
    }
    

    .btn-discover {
      background: #fc4c2f;
      color: #fff;
      padding: 12px 28px;
      font-weight: bold;
      letter-spacing: 1px;
      border: none;
     
    text-decoration: none; /* removes underline */

      
    }

    .scroll-top {
      position: fixed;
      bottom: 30px;
      right: 30px;
      background: #fac539;
      color: white;
      padding: 14px;
      border-radius: 50%;
      font-size: 18px;
      cursor: pointer;
      display: none;
      z-index: 1000;
    }
.img-wrapper {
  position: relative;
  display: inline-block;
  cursor: pointer;
}

.img-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border-radius: 50%;
  background-color: rgba(255, 255, 255, 0.4);
  opacity: 0;
  transition: opacity 0.3s ease;
  pointer-events: none;
}
.img-overlay.active {
  opacity: 1;
}

 .news-section {
            text-align: center;
            margin-bottom: 40px;
        }

        .section-title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .news-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .news-card {
            background-color: #FFF4E0; /* Very light grey background */
            width: 400px; /* Increased card size */
            height: 500px; /* Increased card height */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease;
            padding-bottom: 10px;
        }

        /* Image Styling */
        .news-img {
            position: relative;
            overflow: hidden;
            height: 300px; /* Larger image */
        }

        .news-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .news-img:hover img {
            transform: scale(1.1);
        }

        .date-tag {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: #ff5722;
            color: white;
            padding: 5px 10px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 4px;
        }

        /* Content Styling */
        .news-content {
            padding: 20px;
            text-align: center;
        }

        .admin-info {
            font-size: 14px;
            color: gray;
            margin-bottom: 10px;
        }

        .news-title {
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .news-title:hover {
            color: red;
        }

        /* Circular Arrow Button */
        .read-more {
            display: inline-block;
            margin-top: 15px;
            font-size: 16px;
            font-weight: bold;
            color: black;
            cursor: pointer;
            transition: color 0.3s ease, background-color 0.3s ease;
            width: 35px;
            height: 35px;
            line-height: 35px;
            text-align: center;
            background-color: white;
            border-radius: 50%;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .read-more:hover {
            background-color: red;
            color: white;
        }
       

 .title {
      font-size: 2rem;
      font-weight: bold;
      margin: 20px 0;
      text-align: center;
      text-transform: uppercase;
      color: #333;
    }

    .slider-container {
      width: 100vw;
      overflow: hidden;
      position: relative;
    }

    .card-slider {
      display: flex;
      transition: transform 1.5s ease-in-out;
      will-change: transform;
    }

    .card {
      position: relative;
      width: 25vw;
      height: 350px;
      overflow: hidden;
      flex-shrink: 0;
      transition: transform 0.5s ease-in-out;
    }

    .card img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .card .info {
      position: absolute;
      bottom: 15%;
      left: 50%;
      transform: translateX(-50%);
      background: rgba(0, 0, 0, 0.7);
      color: white;
      padding: 10px;
      border-radius: 5px;
      text-align: center;
      font-size: 16px;
      opacity: 0;
      transition: opacity 0.3s ease-in-out;
      width: 80%;
    }

    .card:hover .info {
      opacity: 1;
    }

    .arrow {
      position: absolute;
      bottom: 10px;
      left: 50%;
      transform: translateX(-50%);
      font-size: 24px;
      color: yellow;
      font-weight: bold;
      width: 40px;
      height: 40px;
      background: rgba(0, 0, 0, 0.7);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      opacity: 0;
      transition: opacity 0.3s ease-in-out;
    }

    .card:hover .arrow {
      opacity: 1;
    }

    .card:hover {
      transform: scale(1.1);
    }

    @media (max-width: 768px) {
      .card {
        width: 60vw;
      }
    }

    @media (max-width: 576px) {
      .card {
        width: 80vw;
      }
    }
@media (max-width: 768px) {
  .highlight-section {
    flex-direction: column;
    gap: 30px;
    padding: 30px 20px;
  }
}


 


 .highlight-section {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 50px;
      background-image: url('https://media.istockphoto.com/id/1400970023/photo/african-elephant-side-view.jpg?s=612x612&w=0&k=20&c=Rib9mqTb6N0j70JdY3_Ptgcmqk0kJ3yFMC6dCXeYa2A=');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      position: relative;
    }

    .text-section {
      flex: 1;
      padding-right: 30px;
      background-color: rgba(255, 255, 255, 0.85); /* Optional: adds readability over image */
      border-radius: 10px;
      padding: 20px;
    }

    .text-section h1 {
      font-size: 3rem;
      font-weight: 800;
      color: #0c1f3d;
    }

    .text-section p {
      font-size: 1.1rem;
      color: #5a5a5a;
      margin-bottom: 20px;
    }

    .benefits-list {
      list-style: none;
      padding-left: 0;
    }

    .benefits-list li {
      display: flex;
      align-items: center;
      font-size: 1.1rem;
      margin-bottom: 10px;
      color: #222;
    }

    .benefits-list li::before {
      content: '➤';
      color: #ffc107;
      margin-right: 10px;
    }

    .membership-card {
      width: 350px;
      background-color: #fbbf24;
      padding: 30px;
      border-radius: 10px;
      position: relative;
      color: #fff;
    }

    .membership-card h2 {
      font-weight: 800;
      font-size: 2rem;
      line-height: 1.2;
    }

    .membership-card .price {
      font-size: 3rem;
      font-weight: bold;
      margin-top: 10px;
    }

    .membership-card .btn-dark {
      margin-top: 20px;
      font-weight: bold;
      letter-spacing: 1px;
    }

    .tiger-img {
      width: 120px;
      position: absolute;
      bottom: 0;
      right: 0;
    }

    .scroll-top-btn {
      position: absolute;
      bottom: 20px;
      right: 20px;
      background-color: #fbbf24;
      color: #fff;
      border: none;
      border-radius: 50%;
      width: 50px;
      height: 50px;
      font-size: 24px;
    }

    .signature {
      font-family: 'Brush Script MT', cursive;
      color: #e74c3c;
      font-size: 2rem;
      margin-top: 30px;
    }
    .testimonial-slider {
      width: 100vw;
      overflow: hidden;
      position: relative;
    }

    .testimonial-container {
      display: flex;
      width: max-content;
      gap: 8px;
      transition: transform 0.5s ease-in-out;
    }

    .testimonial {
      flex: 0 0 300px;
      height: 250px;
      padding: 120px 20px 20px;
      text-align: center;
      background: #d3d3d3;
      border-radius: 10px;
      box-shadow: 0px 4px 6px rgba(0,0,0,0.3);
      position: relative;
      overflow: visible;
      transition: background-color 0.3s ease;
    }

    .testimonial:hover {
      background-color: #a9a9a9;
    }

    .testimonial::before {
      content: "";
      position: absolute;
      top: 0;
      left: 50%;
      width: 0;
      height: 5px;
      background-color: #f0e68c;
      transition: width 0.5s ease-in-out, left 0.5s ease-in-out;
    }

    .testimonial:hover::before {
      width: 100%;
      left: 0;
    }

    .testimonial img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      position: absolute;
      top: 50px;
      left: 50%;
      transform: translate(-50%, -50%);
      border: 5px solid white;
      background: white;
      box-shadow: 0px 4px 6px rgba(0,0,0,0.3);
    }
.Review{
 text-align: center;
      font-size: 16px;
}

  </style>
</head>
<body>

  

    

 <section class="container hero-section">
    <div class="row align-items-center">
      <!-- Image Section -->
      <div class="col-md-6 position-relative text-center">
<div class="img-wrapper" onclick="toggleOverlay()">
  <img src="https://media.istockphoto.com/id/158357821/photo/red-deer.jpg?s=612x612&w=0&k=20&c=_ytvQ9-Ey2CmleK2fG7pwvjMHQm78oaO6J0sX0nm0S4=" alt="Deer" class="hero-img">
  <div class="img-overlay" id="imgOverlay"></div>
</div>
       
        <div class="icon-overlay">
          <i class="fas fa-paw"></i>
        </div>
      </div>
      <!-- Text Content -->
     <div class="col-md-6">
    <h1 class="hero-title">WELCOME TO WILDTOUR<br>EXPLORING NATURE'S WONDERS</h1>
    <p class="hero-highlight">Join us in the adventure of a lifetime while preserving the wild.</p>
    <p class="hero-text">
      Embark on a journey to the heart of nature. Experience the thrill of witnessing wildlife in their natural habitat, and support conservation efforts aimed at protecting endangered species around the world.
    </p>
    <ul class="hero-list list-unstyled">
        <li><i class="fas fa-arrow-right"></i> Explore exotic wildlife from around the globe</li>
        <li><i class="fas fa-arrow-right"></i> Support eco-friendly tourism practices</li>
        <li><i class="fas fa-arrow-right"></i> Experience guided safaris and immersive nature tours</li>
    </ul><br>
    <a href="about.jsp" class="btn-discover"style="margin-top: 50px;">DISCOVER MORE</a>
    
    
</div>

  </section><br><br><br>

<div class="container-fluid highlight-section">
  <div class="text-section">
    <h1>WHY YOU SHOULD CHOOSE<br>OUR ZOO VISIT?</h1>
    <p>There are many variations of passages of but the majority have alteration in some form by injected humour or which don't look even slightly believe.</p>
    <ul class="benefits-list">
    <li>Embark on thrilling safaris to witness wildlife in their natural habitat</li>
<li>Explore diverse ecosystems from lush jungles to expansive savannahs</li>
<li>Support sustainable tourism that helps conserve endangered species</li>
<li>Enjoy expert-guided tours and insightful wildlife education</li>
<li>Make unforgettable memories while protecting the planet's wildlife</li>

    </ul>
   
  </div>

  <div class="membership-card">
    <h2>FAMILY<br>MEMBERSHIP</h2>
    <p class="text-dark mt-3">Yearly Package</p>
    <div class="price">Rs1200.00</div>
    
   
   
  </div>
</div>

<script>
  function scrollToTop() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }
</script>

<br><br>


<center><div id="sliderSection" class="hero-title">Amazing Animals in Our Zoo</div></center><br>


  <div class="slider-container">
    <div class="card-slider" id="cardSlider">
      <div class="card">
        <img src="https://c4.wallpaperflare.com/wallpaper/984/487/746/african-lion-king-lion-animal-wallpaper-preview.jpg" alt="Lion">
        <div class="info">LION - The Majestic King</div>
        
      </div>
      <div class="card">
        <img src="https://media.istockphoto.com/id/177794699/photo/grey-wolf-portrait.jpg?s=612x612&w=0&k=20&c=vEUo0UKAKeCIIm35zU0zR7XDOf-4AKXvJWLZGx4BVws=" alt="Wolf">
        <div class="info">WOLF - The Fearless Hunter</div>
       
      </div>
      <div class="card">
        <img src="https://i.pinimg.com/736x/46/40/9a/46409a4e12a5fa90b462c86f82010a19.jpg" alt="Deer">
        <div class="info">DEER - The Gentle Grazer</div>
        
      </div>
      <div class="card">
        <img src="https://us.images.westend61.de/0001635422pw/side-view-of-monkey-sitting-on-against-tree-in-sri-lanka-forest-on-sunny-day-ADSF33030.jpg" alt="Monkey">
        <div class="info">MONKEY - The Clever Climber</div>
        
      </div>
      <div class="card">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyA7UmOikzdS2lt5Jfl65gfFMAYqzeqpe9Vw&s" alt="Giraffe">
        <div class="info">GIRAFFE - The Towering Beauty</div>
       
      </div>
    </div>
  </div>

  <script>
    const slider = document.getElementById('cardSlider');
    let interval;

    function moveCards() {
      const cardWidth = slider.firstElementChild.offsetWidth;

      // Clone first card
      const firstCard = slider.firstElementChild.cloneNode(true);
      slider.appendChild(firstCard);

      // Slide left
      slider.style.transition = 'transform 1.5s ease-in-out';
      slider.style.transform = `translateX(-${cardWidth}px)`;

      // After transition ends
      setTimeout(() => {
        slider.style.transition = 'none';
        slider.style.transform = 'translateX(0)';
        slider.removeChild(slider.firstElementChild);
      }, 1500);
    }

    function startAutoScroll() {
      interval = setInterval(moveCards, 2500);
    }

    function stopAutoScroll() {
      clearInterval(interval);
    }

    slider.addEventListener('mouseenter', stopAutoScroll);
    slider.addEventListener('mouseleave', startAutoScroll);

    startAutoScroll();
  </script>
<br><br>

<!-- Scroll Top Button -->
  <div class="scroll-top" id="scrollTopBtn">
    <i class="fas fa-arrow-up"></i>
  </div>
<section class="news-section">
    <center> <h1 class="hero-title">LATEST NEWS AND ARTICLES</h1></center><br>
    <div class="news-container">

        <!-- Card 1 -->
        <div class="news-card">
            <div class="news-img">
                <img src="https://e0.pxfuel.com/wallpapers/416/58/desktop-wallpaper-white-tailed-deer-on-whitetail-deer.jpg" alt="Deer">
                <span class="date-tag">10 MAY</span>
            </div>
            <div class="news-content">
                <p class="admin-info">👤 admin | 💬 2,030 Comments</p>
                <h3 class="news-title">The Importance of Protecting Endangered Species</h3>
                <p class="news-description">Learn about the vital conservation efforts being made to protect endangered species like the white-tailed deer and other wildlife.</p>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="news-card">
            <div class="news-img">
                <img src="https://tse2.mm.bing.net/th?id=OIP.3KWDOsDycOfAiBxY5VHv7AHaE7&pid=Api&P=0&h=180" alt="Parrot">
                <span class="date-tag">15 JUNE</span>
            </div>
            <div class="news-content">
                <p class="admin-info">👤 admin | 💬 0 Comments</p>
                <h3 class="news-title">How Ecotourism Can Save Our Rainforests</h3>
                <p class="news-description">Ecotourism helps preserve the delicate ecosystems of rainforests, providing opportunities to engage with nature supporting practices.</p>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="news-card">
            <div class="news-img">
                <img src="https://wallpaperaccess.com/full/196890.png" alt="Monkey">
                <span class="date-tag">10 MAY</span>
            </div>
            <div class="news-content">
                <p class="admin-info">👤 admin | 💬 0 Comments</p>
                <h3 class="news-title">Why Wildlife Sanctuaries Matter for Biodiversity</h3>
                <p class="news-description">Wildlife sanctuaries are crucial in protecting biodiversity. Discover how these safe havens are contributing to the survival of countless species.</p>
            </div>
        </div>

    </div>
</section>

   <div class="Review">
<center><h1 class="hero-title">Reviews</h1></center><br>
</div>
<div class="testimonial-slider">
    <div class="testimonial-container" id="testimonial-container">
      <div class="testimonial">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyHVknd3Rm-dRHG1AeUOLYVaMRJ99F5IfIEQ&s" alt="Person">
        <p>"Amazing service, highly recommended!"</p>
        <strong>Rahul Verma</strong>
      </div>
      <div class="testimonial">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm0jhxD5aOdCoW-TsNm4zM17zrho6DNlXCVg&s" alt="Person">
        <p>"Very satisfied with the experience!"</p>
        <strong>Gautam Patel</strong>
      </div>
      <div class="testimonial">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ3zBs0geInf3Bft5zglH95C6p6PpLpHvf-g&s" alt="Person">
        <p>"Would use again, great quality!"</p>
        <strong>Sanjay V. M</strong>
      </div>
      <div class="testimonial">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTboBzY7WU7_U0j0wZ9gdsjaNRxxMHXut_gQw&s" alt="Person">
        <p>"A fantastic experience!"</p>
        <strong>Geeta Sharma</strong>
      </div>
      <div class="testimonial">
        <img src="https://media.istockphoto.com/id/1562983249/photo/portrait-of-happy-and-successful-businessman-indian-man-smiling-and-looking-at-camera.jpg?s=612x612&w=0&k=20&c=tfBv6taG9nTidFwENcrvEEvRHABN5gDAmg-K1G1Etnc=" alt="Person">
        <p>"Exceptional service and support."</p>
        <strong>Amith Chowgule</strong>
      </div>
      <div class="testimonial">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcwM3L5adB0qTMZC6kKv5U2QyVXJ96vwf_Vw&s" alt="Person">
        <p>"Loved the entire process!"</p>
        <strong>Shivani Patil</strong>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    const container = document.getElementById('testimonial-container');
    const cards = Array.from(container.children);
    const cardWidth = 308; // 300px + 8px gap
    let index = 0;

    // Clone the cards for seamless loop
    cards.forEach(card => {
      const clone = card.cloneNode(true);
      container.appendChild(clone);
    });

    function slideTestimonials() {
      index++;
      container.style.transition = 'transform 0.5s ease-in-out';
      container.style.transform = `translateX(-${index * cardWidth}px)`;

      if (index >= cards.length) {
        setTimeout(() => {
          container.style.transition = 'none';
          container.style.transform = 'translateX(0)';
          index = 0;
        }, 500);
      }
    }

    setInterval(slideTestimonials, 2500);
  </script>
<br><br>


  
<!-- Scroll-to-top JavaScript -->
  <script>
    const scrollBtn = document.getElementById('scrollTopBtn');

    window.onscroll = function () {
      if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
        scrollBtn.style.display = "block";
      } else {
        scrollBtn.style.display = "none";
      }
    };

    scrollBtn.onclick = function () {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    };
  </script>

<script>
  function toggleOverlay() {
    const overlay = document.getElementById('imgOverlay');
    overlay.classList.toggle('active');
  }
</script>

 

</body>
</html>