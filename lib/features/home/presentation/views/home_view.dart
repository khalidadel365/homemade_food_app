import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        title: Row(
          children: [
            Image.asset("assets/logo/food_logo1.png", height: 40),
            const SizedBox(width: 8),
            Text(
              "Homemade Food",
              // style: GoogleFonts.poppins(
              //   color: Colors.white,
              //   fontSize: 20,
              //   fontWeight: FontWeight.bold,
              // ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {
              // TODO: Navigate to cart page
            },
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              // TODO: Navigate to profile page
            },
            child: const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("assets/images/profile/user.jpg"),
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search dishes or chefs...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Popular Chefs Section
            Text(
              "Popular Chefs",
              // style: GoogleFonts.poppins(
              //     fontSize: 18, fontWeight: FontWeight.w600)
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 8, // later dynamic from BLoC
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            "assets/images/chef/chef${index + 1}.jpg"),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Chef ${index + 1}",
                        //style: GoogleFonts.poppins(fontSize: 14)
                      )
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Recommended Dishes
            Text(
              "Recommended for You",
              // style: GoogleFonts.poppins(
              //     fontSize: 18, fontWeight: FontWeight.w600)
            ),
            const SizedBox(height: 12),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12, // later dynamic
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                  child: Row(
                    children: [
                      // Dish Image
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        child: Image.asset(
                          "assets/images/dish/dish${index + 1}.jpg",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Delicious Dish ${index + 1}",
                                  // style: GoogleFonts.poppins(
                                  //     fontSize: 16,
                                  //     fontWeight: FontWeight.w600)
                              ),
                              const SizedBox(height: 4),
                              Text("by Chef ${index + 1}",
                                  // style: GoogleFonts.poppins(
                                  //     fontSize: 14, color: Colors.grey[600])
                              ),
                              const SizedBox(height: 8),
                              Text("${(index + 1) * 20} ج",
                                  // style: GoogleFonts.poppins(
                                  //     fontSize: 16,
                                  //     fontWeight: FontWeight.bold,
                                  //     color: Colors.deepOrange)
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline,
                            color: Colors.deepOrange),
                        onPressed: () {
                          // TODO: Add to cart
                        },
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
