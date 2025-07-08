import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import '../../data/models/services-both-Jo-Re-model.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:ServicesPage(),
    );
  }
}

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body:
      GetX<BothJoysReHallController>(
        init: BothJoysReHallController(),
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          }

          return
            ListView(
            children: [
              // عرض خدمات joys_services
              if (controller.joysServices.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Joys Services",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ...controller.joysServices.map((service) => ServiceItem(service: service)),

              // عرض خدمات condolences_services
              if (controller.condolencesServices.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Condolences Services",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ...controller.condolencesServices.map((service) => ServiceItem(service: service)),
            ],
          );
        },
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final ViewUserDetailsServiceModel service;

  ServiceItem({required this.service});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(service.name),
      subtitle: Text(service.description),
      leading: service.images.isNotEmpty
          ? Image.network(ApiConst.urlImage+service.images[0].imagePath)
          : null,
      onTap: () {
        Get.to(() => ServiceDetailsPage(service: service));
      },
    );
  }
}

class ServiceDetailsPage extends StatelessWidget {
  final ViewUserDetailsServiceModel service;

  ServiceDetailsPage({required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              service.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            if (service.images.isNotEmpty)
              Image.network(ApiConst.urlImage+service.images[0].imagePath),
            if (service.video != null) ...[
              SizedBox(height: 20),
              Text("Video:"),
              // Display the video player or video link here
            ],
            SizedBox(height: 20),
            Text(
              'Price: \$${service.servicePrice}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
