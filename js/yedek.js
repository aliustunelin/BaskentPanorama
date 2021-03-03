var panorama, panorama2, panorama3, panorama4, viewer, container, infospot;

var lookAtPositions = [
  new THREE.Vector3(4871.39, 1088.07, -118.41),
  new THREE.Vector3(1278.27, 732.65, 4769.19),

];

var infospotPositions = [
  new THREE.Vector3(3136.06, 1216.30, -3690.14),
  new THREE.Vector3(3258.81, -295.50, 3771.13)
];

container = document.querySelector( '#container' );

panorama = new PANOLENS.ImagePanorama( '../img/sakaryaGenel.jpg' );
panorama.addEventListener( 'enter-fade-start', function(){
  viewer.tweenControlCenter( lookAtPositions[0], 0 );
} );

panorama2 = new PANOLENS.ImagePanorama( '../img/kentMeydani.jpg' );
panorama2.addEventListener( 'enter', function(){
  viewer.tweenControlCenter( lookAtPositions[1], 0 );
} );


panorama3 = new PANOLENS.ImagePanorama( '../img/maviDurak.jpg' );
panorama3.addEventListener( 'enter', function(){
  viewer.tweenControlCenter( lookAtPositions[1], 0 );
} );


panorama4 = new PANOLENS.ImagePanorama( '../img/kampus.jpg' );
panorama4.addEventListener( 'enter', function(){
  viewer.tweenControlCenter( lookAtPositions[0], 0 );
} );

panorama.link( panorama2, infospotPositions[0] );
panorama2.link( panorama3, infospotPositions[1] );
panorama3.link( panorama4, infospotPositions[0] );
panorama4.link( panorama, infospotPositions[1] );

infospot = new PANOLENS.Infospot( 350, PANOLENS.DataImage.Info );
infospot.position.set( 0, 0, -5000 );
infospot.addHoverText('Serdivan Belediyesi', 40);

infospot2 = new PANOLENS.Infospot( 350, PANOLENS.DataImage.Info );
infospot2.position.set( 0, 0, -5000 );
infospot2.addHoverText('Kent Meydanı', 40);


infospot3 = new PANOLENS.Infospot( 350, PANOLENS.DataImage.Info );
infospot3.position.set( 0, 0, -5000 );
infospot3.addHoverText('Mavi Durak', 40);


infospot4 = new PANOLENS.Infospot( 350, PANOLENS.DataImage.Info );
infospot4.position.set( 0, 0, -5000 );
infospot4.addHoverText('Kampüs Kapı', 40);


panorama.add( infospot );
panorama2.add( infospot2 );
panorama3.add( infospot3 );
panorama4.add( infospot4 );

viewer = new PANOLENS.Viewer( { output: 'console', container: container } );
viewer.add( panorama, panorama2 , panorama3, panorama4);

