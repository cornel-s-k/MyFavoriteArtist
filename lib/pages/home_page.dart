import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final VoidCallback toggleTheme;

  HomePage({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Public Figure'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/cornel.jpeg'),
                    ),
                    SizedBox(height: 10),
                    Text('Cornelia Lidya', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('FYI', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var artist in [
                        {'image': 'assets/images/renjun.jpg', 'name': 'Big Boss NCT Dream'},
                        {'image': 'assets/images/jisung.jpg', 'name': 'Maknae NCT Dream'},
                        {'image': 'assets/images/mark.jpg', 'name': 'Leader NCT Dream'},
                        {'image': 'assets/images/Chenle.jpg', 'name': 'Big Head NCT Dream'},
                        {'image': 'assets/images/Jeno.jpg', 'name': 'Captain NCT Dream'},
                        {'image': 'assets/images/Jaemin.jpg', 'name': 'Visual NCT Dream'}
                      ])
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(artist['image']!, width: 100, height: 100, fit: BoxFit.cover),
                              ),
                              SizedBox(height: 5),
                              Text(artist['name']!, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Galeri', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  var galleryItems = [
                    {'image': 'assets/images/zayne.jpg', 'desc': 'Deskripsi Zayne'},
                    {'image': 'assets/images/rafayel.jpg', 'desc': 'Deskripsi Rafayel'},
                    {'image': 'assets/images/isagi.jpg', 'desc': 'Deskripsi Isagi'},
                    {'image': 'assets/images/haechan.jpg', 'desc': 'Deskripsi Haechan'}
                  ];

                  var galleryItem = galleryItems[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(imagePath: galleryItem['image']!, description: galleryItem['desc']!),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(galleryItem['image']!, fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Text('Discografi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ListTile(
                leading: Image.asset('assets/images/chase.jpg', width: 50),
                title: Text('Swim'),
              ),
              ListTile(
                leading: Image.asset('assets/images/outoftime.jpg', width: 50),
                title: Text('Out Of Time'),
              ),
              ListTile(
                leading: Image.asset('assets/images/meddleabout.jpg', width: 50),
                title: Text('Meddle About'),
              ),
              SizedBox(height: 20),
              Text('Bio', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/cornel.jpeg'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cornel', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('"Hidup adalah petualangan."'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
