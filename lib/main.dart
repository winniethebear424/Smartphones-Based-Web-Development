import 'dart:io'; 
import 'package:flutter/material.dart'; 
import 'package:image_picker/image_picker.dart'; 
import 'package:flutter/foundation.dart';


void main() { 
runApp(new MyApp()); 
} 

class MyApp extends StatelessWidget { 
@override 
Widget build(BuildContext context) { 
	return new MaterialApp( 
	home: new CameraAccess(), 
	debugShowCheckedModeBanner: false, 
	); 
} 
} 

class CameraAccess extends StatefulWidget { 
@override 
State<StatefulWidget> createState() { 
	return new CameraAccessState(); 
} 
} 

class CameraAccessState extends State<CameraAccess> { 
File? cameraFile; // Change to nullable File

@override 
Widget build(BuildContext context) { 
	//display image selected from gallery 
	selectFromCamera() async { 
	XFile? cameraFile=await ImagePicker().pickImage( 
		source: ImageSource.camera, 
		// maxHeight: 50.0, 
		// maxWidth: 50.0, 
	); 
  if (cameraFile != null) 
    this.cameraFile = File(cameraFile.path);
	setState(() {}); 
	} 

	return new Scaffold( 
	appBar: new AppBar( 
		title: new Text("Camera Access"), 
		backgroundColor: Colors.green, 
		actions: <Widget>[ 
		Text("GFG",textScaleFactor: 3,) 
		], 
	), 
	body: new Builder( 
		builder: (BuildContext context) { 
		return Center( 
			child: new Column( 
			mainAxisAlignment: MainAxisAlignment.center, 
			children: <Widget>[ 
				ElevatedButton( 
				child: new Text('Select Image from Camera'), 
				onPressed: selectFromCamera 
				), 
				SizedBox( 
				height: 200.0, 
				width: 300.0, 
				child: cameraFile == null 
					? Center(child: Text('Sorry nothing selected!!')) 
					: Center(
              child: kIsWeb
                  ? Image.network(cameraFile!.path)
                  : Image.file(cameraFile!),
				) ,
        ),
			], 
			), 
		); 
		}, 
	), 
	); 
} 
} 
