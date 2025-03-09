import 'package:flutter/material.dart';
import '../widgets/carousel_slider_widget.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollControllerNews = ScrollController();
  ScrollController _scrollControllerMessages = ScrollController();
  ScrollController _scrollControllerRecruiters = ScrollController();

  List<String> _newsItems = [
    'Agriculture GDP Contribution Doubles Due to Technological Advancements',
    'AI-Powered Crop Monitoring Boosts Farmers',
    'Government Announces New Subsidies for Smart Farming Equipment',
    'Precision Agriculture Reduces Water Usage by 30% in Drought-Prone Areas',
    'Drone Technology Revolutionizing Pest Control in Large-Scale Farming',
  ];

  List<String> _messageItems = [
    'Soil moisture levels are low, irrigation recommended today.',
    'Next week: Expected rainfall, adjust watering schedules accordingly.',
    'Fertilization reminder: Best time to apply nutrients this weekend.',
    'Pest alert: High risk of infestation detected in your region',
    'AI update: New disease detection model improves accuracy by 20%.',
    'Market prices updated! Check the latest crop rates in your area.',
  ];

  List<String> _recruiters = [
    'lib/assets/images/genpact.png',
    'lib/assets/images/amazon.png',
    'lib/assets/images/infosys.png',
    'lib/assets/images/ibm.png',
    'lib/assets/images/deloitte.png',

  ];

  @override
  void initState() {
    super.initState();
    _autoScrollNews();
    _autoScrollMessages();
    _autoScrollRecruiters();
  }

  void _autoScrollNews() {
    Future.delayed(Duration(seconds: 1), () {
      if (_scrollControllerNews.hasClients) {
        final maxScroll = _scrollControllerNews.position.maxScrollExtent;
        final currentScroll = _scrollControllerNews.offset;
        final increment = 50.0;
        if (currentScroll < maxScroll) {
          _scrollControllerNews.animateTo(
            currentScroll + increment,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          ).then((_) => _autoScrollNews());
        } else {
          _scrollControllerNews.jumpTo(0.0);
          _autoScrollNews();
        }
      }
    });
  }

  void _autoScrollMessages() {
    Future.delayed(Duration(seconds: 1), () {
      if (_scrollControllerMessages.hasClients) {
        final maxScroll = _scrollControllerMessages.position.maxScrollExtent;
        final currentScroll = _scrollControllerMessages.offset;
        final increment = 50.0;
        if (currentScroll < maxScroll) {
          _scrollControllerMessages.animateTo(
            currentScroll + increment,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          ).then((_) => _autoScrollMessages());
        } else {
          _scrollControllerMessages.jumpTo(0.0);
          _autoScrollMessages();
        }
      }
    });
  }

  void _autoScrollRecruiters() {
    Future.delayed(Duration(seconds: 1), () {
      if (_scrollControllerRecruiters.hasClients) {
        final maxScroll = _scrollControllerRecruiters.position.maxScrollExtent;
        final currentScroll = _scrollControllerRecruiters.offset;
        final increment = 50.0;
        if (currentScroll < maxScroll) {
          _scrollControllerRecruiters.animateTo(
            currentScroll + increment,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          ).then((_) => _autoScrollRecruiters());
        } else {
          _scrollControllerRecruiters.jumpTo(0.0);
          _autoScrollRecruiters();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollControllerNews.dispose();
    _scrollControllerMessages.dispose();
    _scrollControllerRecruiters.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI CROP CARE',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('lib/assets/images/jits.png', height: 100),
            CarouselSliderWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      // Image.asset('lib/assets/images/UGC.png', height: 200, width: 200),
                      // Image.asset('lib/assets/images/NBA.jpg', height: 200, width: 200),
                      // Image.asset('lib/assets/images/NAAC_A.jpg', height: 200, width: 200),
                      // Image.asset('lib/assets/images/JNTUH.jpg', height: 200, width: 200),
                      // Image.asset('lib/assets/images/ISO.jpg', height: 200, width: 200),
                      // Image.asset('lib/assets/images/AICTE.jpg', height: 200, width: 200),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Best APP FOR FARMERS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'With cutting-edge AI technology, AI Crop Care empowers farmers with real-time crop monitoring and smart insights for better yield.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset('lib/assets/images/our_college_news.jpg', width: double.infinity, fit: BoxFit.cover),
                  SizedBox(height: 10),
                  Text(
                    'Our Agriculture news ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      controller: _scrollControllerNews,
                      shrinkWrap: true,
                      itemCount: _newsItems.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue),
                          ),
                          child: Text(
                            _newsItems[index],
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset('lib/assets/images/EU.jpg', width: double.infinity, height: 100, fit: BoxFit.cover),
                  SizedBox(height: 10),
                  Text(
                    'Important Messages',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      controller: _scrollControllerMessages,
                      shrinkWrap: true,
                      itemCount: _messageItems.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.yellow[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.yellow),
                          ),
                          child: Text(
                            _messageItems[index],
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'AI-Driven Agri Solutions',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showCourses(context, 'Crop', [
                            'Real-time soil moisture tracking',
                            'Temperature monitoring',
                            'Weather forecasting',
                            'Disease detection',

                          ]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: Text(
                          'Crop',

                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showCourses(context, 'Pest', [

                            'AI-based plant disease recognition',
                            'Pest identification',
                          ]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: Text(
                          'Pest',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showCourses(context, 'IG', [
                            'Automated water scheduling',
                            'Drip irrigation insights',
                            'Soil moisture-based alerts',
                          ]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: Text(
                          'Irrigation',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showCourses(context, 'Market', [
                            'Current crop prices',
                          ]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: Text(
                          'Market',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Top Notch Recruiters
                  Text(
                    'Trusted Agri Partners',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'At AI Crop Care, we collaborate with leading agricultural experts, research institutions, and technology pioneers to bring cutting-edge solutions to farmers. Our trusted partners play a crucial role in enhancing crop productivity, optimizing irrigation, and ensuring sustainable farming practices.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      controller: _scrollControllerRecruiters,
                      scrollDirection: Axis.horizontal,
                      itemCount: _recruiters.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Image.asset(
                            _recruiters[index],
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  // University Gold Medalists
                  // Text(
                  // 'UNIVERSITY GOLD MEDALISTS',
                  // style: TextStyle(
                  // fontSize: 24,
                  // fontWeight: FontWeight.bold,
                  // color: Colors.blue,
                  // ),
                  // ),
                  // Column(
                  // children: [
                  // Image.asset('lib/assets/images/university_gold_medalists_1.jpg', height: 150),
                  // Image.asset('lib/assets/images/university_gold_medalists_2.jpg', height: 150),
                  // ],
                  // ),
                  // SizedBox(height: 20),
                  // Blue background section
                  Container(
                    width: double.infinity, // Ensure the container covers the full width
                    color: Color(0xFF040751), // Blue background color
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Image.asset('lib/assets/images/jits.png', height: 100),
                        SizedBox(height: 10),
                        Text(
                          'AI Crop Care ensures precision agriculture with advanced disease detection, soil moisture tracking, and automated alerts.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Examination section
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Farmer Resources',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () => _showExamBranch(context),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Government Schemes & Subsidies',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _showNotifications(context),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Latest Agriculture News',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _showExamSchedules(context),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Market Prices & Trends',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _showResults(context),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Fertilizer & Pesticide Guidelines',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _showCertificateVerification(context),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Weather Forecast & Advisory',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // R&D section
                              Text(
                                'R&D',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () => _showCommittee(context),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Committee',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _showPublications(context),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Publications',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _showFundReceived(context),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Fund Received',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _showInnovationCell(context),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Innovation Cell',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _showMOUs(context),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'MOUs',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _showCodeOfEthics(context),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Code of Ethics',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // Reach Us section
                              Text(
                                'Reach Us',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'AI Crop Care office\nRoad NO.5 , HB Colony.\nKarimnagar, Telangana 505527',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Image.asset('lib/assets/images/facebook.png'),
                                    iconSize: 30,
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Image.asset('lib/assets/images/twitter.png'),
                                    iconSize: 30,
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Image.asset('lib/assets/images/linkedin.png'),
                                    iconSize: 30,
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Image.asset('lib/assets/images/instagram.png'),
                                    iconSize: 30,
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Image.asset('lib/assets/images/youtube.png'),
                                    iconSize: 30,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              // Footer section
                              Text(
                                '© 2025 AI CROP CARE',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () => _showPrivacyPolicy(context),
                                child: Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () => _showTermsConditions(context),
                                child: Text(
                                  'Terms & Conditions',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCourses(BuildContext context, String title, List<String> courses) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Column(
            children: courses.map((course) => Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue),
              ),
              child: Row(
                children: [
                  Expanded(child: Text(course, style: TextStyle(fontSize: 16, color: Colors.black))),
                ],
              ),
            )).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showExamBranch(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Government Schemes & Subsidies'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/images/eb.png', width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'Here are the Government Schemes and Subsidies.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showNotifications(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Latest Agriculture News'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/images/n.png', width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'Stay updated with the latest notifications.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showExamSchedules(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Market Prices & Trends'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/images/es.png', width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'Check the latest prices here.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showResults(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Fertilizer & Pesticide Guidelines'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/images/r.png', width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'View the guidelines here.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showCertificateVerification(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Weather Forecast & Advisory'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/images/w.png', width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'Here is the quick weather update',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showCommittee(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Committee'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/images/rdc.png', width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'Learn about our R&D committees.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showPublications(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Publications'),
        content: SingleChildScrollView(
          child: Column(

            children: [
              Image.asset('lib/assets/images/p.png', width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'Explore our latest publications.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showFundReceived(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Fund Received'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/images/fr.png', width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'Details about the funds received.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showInnovationCell(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Innovation Cell'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/images/ic.png', width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'Discover innovations in our R&D cell.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showMOUs(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('MOUs'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/images/m.png', width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'Memoranda of Understanding details.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showCodeOfEthics(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Code of Ethics'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/images/coe.png', width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'Read our R&D code of ethics.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Privacy Policy'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/images/pp.png', width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'AI Crop Care |\n Innovative Solution in Agriculture field \n\nPrivacy Policy\n\nHomePrivacy Policy\n\nThis Privacy Policy (“Privacy Policy”) describes how we, AI Crop Care  (“we” or “us”) collect, use and share information about our users (“you”) through our Platform. Please review our Terms of Use and Privacy Policy (collectively the “Terms”) that govern the use of the Platform and Programs. This Privacy Policy shall form a part of the Terms by way of reference. All capitalized terms not defined in this Privacy Policy, have the respective meanings set forth in the Terms of Use. This Privacy Policy applies only to the part of the Platform provided by AI Crop Care , and we are not responsible for the practices of persons, companies, institutions or websites or app that JITS does not control, manage, or employ. Please understand that by using our Platform or submitting any Personally Identifiable Information (defined below) to us, you consent and agree that we may collect, use, disclose and retain your information (including but not limited to your Personally Identifiable Information) in accordance with this Privacy Policy and our Terms of Use, and as permitted or required by law. AI Crop Care reserves the right to share the information collected hereunder with its own affiliates. In the event of sale or transfer of all or a portion of our business assets, consumer information may be one of the business assets that are transferred as part of the transaction. If you do not agree with these Terms, then please do not provide any Personally Identifiable Information to us. If you refuse or withdraw your consent, or if you choose not to provide us with any required Personally Identifiable Information, we may not be able to provide you with the services that can be offered on our Platform.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showTermsConditions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Terms & Conditions'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/images/tc.png', width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 10),
              Text(
                'Terms & Conditions\n\nThis app is designed, developed and maintained by AI Crop Care  to disseminate information to AI Crop care  stakeholders in particular and public in general. Though all efforts have been made to ensure the accuracy and currency of the content on this app, the same should not be construed as a statement of law or used for any legal purposes. The documents and information displayed in this app are for reference purposes only and does not purport to be a legal document. In case of any ambiguity or doubt, users are advised to verify/check with the departments and/or other source(s), and obtain professional advice.',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}