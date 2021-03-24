import 'package:flutter/material.dart';
import 'package:doctor_app/scale_animation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool small = true;
  bool appear = true;
  bool welcomeAppear = false;
  bool againAppear = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              small = !small;
            });
          },
          child: welcomeAppear
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WelcomeText(
                      onEnd: () {
                        // Future.delayed(Duration(milliseconds: 200), () {
                        //   setState(() {
                        //     againAppear = true;
                        //   });
                        // });
                      },
                    ),
                    SizedBox(height: 30),
                    // if (againAppear) ...[
                    AgainButton(
                      onPressed: () {
                        setState(() {
                          welcomeAppear = false;
                          againAppear = false;
                          appear = true;
                          small = true;
                        });
                      },
                    )
                    // ]
                  ],
                )
              : AnimatedOpacity(
                  onEnd: () {
                    setState(() {
                      if (!appear) {
                        welcomeAppear = true;
                      }
                    });
                  },
                  duration: Duration(milliseconds: 400),
                  opacity: appear ? 1 : 0,
                  child: ClickMeButton(
                    small: small,
                    onEnd: () {
                      if (!small) {
                        setState(() {
                          appear = false;
                        });
                      }
                    },
                  ),
                ),
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key key,
    @required this.onEnd,
  }) : super(key: key);
  final Function onEnd;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      onEnd: onEnd,
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 700),
      curve: Curves.ease,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Text(
            "Welcome To Your App",
            style: (TextStyle(fontSize: 30)),
          ),
        );
      },
    );
  }
}

class AgainButton extends StatefulWidget {
  const AgainButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);
  final Function onPressed;
  @override
  _AgainButtonState createState() => _AgainButtonState();
}

class _AgainButtonState extends State<AgainButton> {
  bool small = true;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      onEnd: widget.onPressed,
      tween: Tween<double>(begin: 1, end: small ? 1 : 10),
      duration: Duration(milliseconds: 700),
      builder: (context, value, child) => Transform.scale(
        scale: value,
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 500, end: 0),
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
          builder: (context, value, child) => Transform.translate(
            offset: Offset(0, value),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  small = !small;
                });
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                ),
                child: Center(
                  child: Text(
                    small ? "Again" : "",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ClickMeButton extends StatefulWidget {
  const ClickMeButton({
    Key key,
    @required this.small,
    @required this.onEnd,
  }) : super(key: key);

  final bool small;
  final Function onEnd;

  @override
  _ClickMeButtonState createState() => _ClickMeButtonState();
}

class _ClickMeButtonState extends State<ClickMeButton> {
  bool startAnimation = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          startAnimation = !startAnimation;
        });
      },
      child: ScaleAnimation(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
          ),
          child: Center(
            child: Text(
              startAnimation ? "" : "Click Me",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        startAnimation: startAnimation,
      ),
    );
  }
}
