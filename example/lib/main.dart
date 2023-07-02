import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:obscure_widget/obscure_widget.dart';

void main() {
  runApp(const MyApp());
}

const primaryColor = Color(0xFF4169e1);
const whiteColor = Color(0xFFFFFFFF);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailCardScreen(),
    );
  }
}

class DetailCardScreen extends StatelessWidget {
  const DetailCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Detail Card',
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: const [
          CardView(),
          CardControls(),
          CardInformation(),
        ],
      ),
    );
  }
}

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
        image: const DecorationImage(
          image: AssetImage('assets/card_bg.png'),
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 16.0,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: ObscureWidget.builder(
          obscureBuilder: (_, bool isCaptured, Widget? child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Platinum',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  isCaptured ? '**** **** **** ****' : '1288 7068 2260 2640',
                  style: const TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24.0),
                Row(
                  children: [
                    // Card Holder
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'Card Holder\n'),
                          TextSpan(
                            text: isCaptured ? '**** ****' : 'Aden Erickson',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(width: 32.0),

                    // Expires
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'Expires\n'),
                          TextSpan(
                            text: isCaptured ? '**/**' : '05/24',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const Spacer()
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CardControls extends StatelessWidget {
  const CardControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _button('Lock Card', CupertinoIcons.lock_fill),
          _button('History Card', CupertinoIcons.doc_chart_fill),
          _button('Setting Card', CupertinoIcons.settings_solid),
        ],
      ),
    );
  }

  Widget _button(String label, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: primaryColor,
          child: Icon(
            icon,
            color: whiteColor,
            size: 28,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class CardInformation extends StatelessWidget {
  const CardInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(18.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 16.0,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _slidingBar,
            Text(
              'Card Information',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16.0),
            _infoItem(
              context,
              label: 'Card Number',
              data: '1288 7068 2260 2640',
              icon: CupertinoIcons.creditcard_fill,
            ),
            _infoItem(
              context,
              label: 'Expiration date',
              data: '05/24',
              icon: CupertinoIcons.calendar,
            ),
            _infoItem(
              context,
              label: 'Information CVV',
              data: '324',
              icon: CupertinoIcons.lock_fill,
            ),
          ],
        ),
      ),
    );
  }

  Widget get _slidingBar {
    return Center(
      child: Container(
        height: 5.0,
        width: 50.0,
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }

  Widget _infoItem(
    BuildContext context, {
    required String label,
    required String data,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: primaryColor,
          ),
          const SizedBox(width: 8.0),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            data,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ).obscured(
            colorOpacity: 0.1,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ],
      ),
    );
  }
}
