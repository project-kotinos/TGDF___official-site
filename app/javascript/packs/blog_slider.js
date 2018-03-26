export default function() {
  const $el = $('.blog-carousel');
  if($el.length) {
    const childCount = $el.children().length;

    $el.owlCarousel({
      loop: childCount > 1,
      margin: 30,
      nav: childCount > 1,
      dots: false,
      autoplayHoverPause: false,
      autoplay: 6000,
      smartSpeed: 700,
      navText: [ '<span class="fa fa-angle-left"></span>', '<span class="fa fa-angle-right"></span>' ],
      responsive:{
        0:{
          items:1
        },
        600:{
          items:1
        },
        800:{
          items:1
        },
        1024:{
          items:1
        },
        1100:{
          items:1
        },
        1200:{
          items:1
        }
      }
    })
  }
}
