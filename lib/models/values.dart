
import 'package:get/get.dart';



class Values {
  Values({required this.offset,
  required this.amountOfElements,
    required this.radialVelocity,
    required this.leftPosition,
    required this.title,
    required this.message,
    required this.duration,
    required this.boxWidth,
    required this.separatorWidth,
  } );

   double offset;
   int amountOfElements ;
   int radialVelocity ;
   double leftPosition ;
   String title;
   String message ;
   Duration duration;
   double boxWidth;
   double separatorWidth ;
   var angle = 0.0.obs;
   var selectedElementIndex = 0.obs;

  factory  Values.data(Map<String, dynamic> init) => Values(
       offset: init['offset'].toDouble(),
       amountOfElements: init['amountOfElements'],
       radialVelocity: init['radialVelocity'],
       leftPosition: init['leftPosition'].toDouble(),
       title: init['title'],
       message: init['message'],
       duration: init['duration'],
       boxWidth: init['boxWidth'].toDouble(),
       separatorWidth: init['separatorWidth'].toDouble(),
  );


}