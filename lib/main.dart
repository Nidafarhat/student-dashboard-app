import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Dashboard',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _centerText = "Welcome Back, Student!";
  int _taskCount = 3;

  final List<String> _titles = ["Home", "Courses", "Profile"];

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) _centerText = "Welcome Back, Student!";
      if (index == 1) _centerText = "Your Courses Are Ready";
      if (index == 2) _centerText = "Your Profile";
    });
  }

  void _onFabPressed() {
    setState(() => _taskCount++);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("New Task Added! Total Tasks: $_taskCount"),
        backgroundColor: const Color(0xFF4F46E5),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),

      // 2. AppBar
      appBar: AppBar(
        title: const Text(
          "Student Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF4F46E5),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Color(0xFF4F46E5)),
            ),
          ),
        ],
      ),

      // 1. Scaffold Body + 7. Center
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEF2FF),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.school_rounded,
                        size: 50,
                        color: Color(0xFF4F46E5),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _centerText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Selected Tab: ${_titles[_selectedIndex]}  •  Tasks: $_taskCount",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),

                    // 8. ElevatedButton
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _centerText = "Great! You Clicked Explore";
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Explore button clicked!"),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4F46E5),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          "Explore Now",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // 8. TextButton
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _centerText = "Welcome Back, Student!";
                          _taskCount = 3;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Reset Done!")),
                        );
                      },
                      child: const Text(
                        "Reset Dashboard",
                        style: TextStyle(color: Color(0xFF4F46E5)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // 4. FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        backgroundColor: const Color(0xFF4F46E5),
        child: const Icon(Icons.add, color: Colors.white),
      ),

      // 3. BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTap, // 5. Listener
        selectedItemColor: const Color(0xFF4F46E5),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}