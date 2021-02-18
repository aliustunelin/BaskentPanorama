//https://codepen.io/alistnel/pen/rNWwNed?editors=1010

const container = document.querySelector('#container');

const panorama = new PANOLENS.ImagePanorama( '../img/istanbul1.jpg' );
const panorama2 = new PANOLENS.ImagePanorama( '../img/london.jpg' );




const infospot = new PANOLENS.Infospot(300, PANOLENS.DataImage.Info);
infospot.position.set(0,0,-7000);
infospot.addHoverText('London!', 40);
infospot.addEventListener( 'click', function(){
    viewer.setPanorama( panorama2 );
  } );



const viewer = new PANOLENS.Viewer({container:container, 
    //    autoRotate: true
    });
    
panorama.add(infospot);

viewer.add(panorama);    

viewer.add( panorama, panorama2 );

viewer.addUpdateCallback(function(){
  
});