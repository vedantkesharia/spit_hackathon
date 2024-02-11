import 'package:coffeeft/screens/DetailsScreen/Details_Screen.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';

import 'constants.dart';

class SchemeCards extends StatelessWidget {
  SchemeCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SchemeCard(name: 'Pradhan Mantri Kisan Samman Nidhi', image: 'assets/images/3.png', page:'https://www.pmkisan.gov.in/' ,),
          SchemeCard(name: 'Pradhan Mantri Fasal BimaYojana', image: 'assets/images/1.png', page: 'https://pmfby.gov.in/',),
          SchemeCard(name: 'Agriculture Infrastructure Fund', image: 'assets/images/2.png', page: 'https://www.agriinfra.dac.gov.in/',),
        ],
      ),
    );
  }
}

class CurrentInsuranceCards extends StatelessWidget {
  const CurrentInsuranceCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Card(name: 'Weather Insurance', image: 'assets/images/cloudy.png', limit: '30000',),
        ],
      ),
    );
  }
}

class InsuranceCards extends StatelessWidget {
  const InsuranceCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Card(name: 'Livestock Insurance', image: 'assets/images/livestock.png', limit: '100000',),
          Card(name: 'Weather Insurance', image: 'assets/images/cloudy.png', limit: '30000',),
          Card(name: 'Crop Insurance', image: 'assets/images/wheat.png', limit: '10000'),
        ],
      ),
    );
  }
}

class CurrentLoanCards extends StatelessWidget {
  const CurrentLoanCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Card(name: 'Land Loan', image: 'assets/images/field.png', limit: '500000',),
          Card(name: 'Machine Loan', image: 'assets/images/tractor.png', limit: '300000',),
        ],
      ),
    );
  }
}

class LoanCards extends StatelessWidget {
  const LoanCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Card(name: 'Crop Loan', image: 'assets/images/wheat.png', limit: '10000'),
          Card(name: 'Land Loan', image: 'assets/images/field.png', limit: '500000',),
          Card(name: 'Machine Loan', image: 'assets/images/tractor.png', limit: '300000',),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  Card({
    required this.name,
    required this.image,
    required this.limit,
    this.page,
  });

  late final name;
  late final image;
  late final limit;
  late final page;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: getproportionatescreenwidth(15)),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(
                        image: image,
                        name: name,
                        limit: limit,
                      )));
        },
        child: SizedBox(
          width: getproportionatescreenwidth(350),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: deepgreen,
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getproportionatescreenheight(5),
              ),
              Text(
                name,
                style: kimptext.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 15),
                maxLines: 2,
              ),
              SizedBox(
                height: getproportionatescreenheight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upto ₹" + limit,
                    style: TextStyle(
                        color: deepgreen,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(getproportionatescreenheight(8)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: deepgreen,
                      ),
                      child: Container(
                        child: Text(
                          "Apply",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SchemeCard extends StatelessWidget {
  SchemeCard({
    required this.name,
    required this.image,
    this.page,
  });

  late final name;
  late final image;
  late final page;

  //final Uri _url = Uri.parse(page);

  // Future<void> _launchUrl(page) async {
  //   if (!await launchUrl(Uri.parse(page))) {
  //     throw Exception('Could not launch $page');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: getproportionatescreenwidth(15)),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: ()  {
        },
        child: SizedBox(
          width: getproportionatescreenwidth(350),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: deepgreen,
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getproportionatescreenheight(5),
              ),
              Text(
                name,
                style: kimptext.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 15),
                maxLines: 2,
              ),
              SizedBox(
                height: getproportionatescreenheight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(getproportionatescreenheight(8)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: deepgreen,
                      ),
                      child: Container(
                        child: Text(
                          "Apply",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
