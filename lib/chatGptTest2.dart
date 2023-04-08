import 'package:flutter/material.dart';

class Candidate {
  final String name;
  final String party;
  final String bio;

  Candidate({required this.name, required this.party, required this.bio});
}

class CandidateTile extends StatelessWidget {
  final Candidate candidate;

  CandidateTile({required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://source.unsplash.com/200x200/?portrait,' +
                  candidate.name),
        ),
        title: Text(
          candidate.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          candidate.party,
          style: TextStyle(color: Colors.grey),
        ),
        trailing: IconButton(
          icon: Icon(Icons.check_circle),
          onPressed: () {
            //TODO: handle vote button press
          },
        ),
      ),
    );
  }
}

class CandidateListPage extends StatefulWidget {
  @override
  _CandidateListPageState createState() => _CandidateListPageState();
}

class _CandidateListPageState extends State<CandidateListPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return CustomPaint(
                  painter: BackgroundPainter(_animation.value),
                );
              },
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Election Candidates',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: candidates.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CandidateTile(candidate: candidates[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final double animationValue;

  BackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final gradient = RadialGradient(
      center: const Alignment(0.7, -0.6),
      radius: 0.5 + animationValue * 5.0,
      colors: [
        Color(0xFF4B4DFF),
        Color(0xFF4B4DFF),
        Color(0xFF7A7AFF),
        Color(0xFFB0B0FF),
      ],
      stops: [0.0, 0.5, 0.7, 1.0],
    );

    final paint = Paint()..shader = gradient.createShader(rect);
    final path = Path();

    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.25, size.height, size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.6, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) {
    return animationValue != oldDelegate.animationValue;
  }
}

List<Candidate> candidates = [
  Candidate(
      name: 'John Doe',
      party: 'Democratic Party',
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non semper sapien.'),
  Candidate(
      name: 'Jane Smith',
      party: 'Republican Party',
      bio:
          'Pellentesque ut magna ac felis sagittis aliquam. Suspendisse potenti.'),
  Candidate(
      name: 'Mike Johnson',
      party: 'Green Party',
      bio:
          'Proin vel ex rhoncus, dapibus sapien in, dictum purus. Nullam at blandit purus.'),
  Candidate(
      name: 'Sarah Lee',
      party: 'Libertarian Party',
      bio:
          'Etiam volutpat arcu vel sapien pretium malesuada. Sed nec ipsum vestibulum, pharetra purus a, rhoncus erat.'),
];
