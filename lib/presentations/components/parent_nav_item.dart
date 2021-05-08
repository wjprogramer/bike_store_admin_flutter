import 'package:bike_store_admin_flutter/presentations/components/my_animated_rotation.dart';
import 'package:bike_store_admin_flutter/presentations/components/my_animated_size.dart';
import 'package:flutter/material.dart';

const _toggleDuration = const Duration(milliseconds: 300);

class ParentNavItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final List<Widget> children;

  ParentNavItem({
    this.text = '',
    @required this.icon,
    @required this.children,
  });

  @override
  _ParentNavItemState createState() => _ParentNavItemState();
}

class _ParentNavItemState extends State<ParentNavItem> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(
            widget.icon,
            color: Colors.white54,
            size: 16,
          ),
          trailing: MyAnimatedRotation(
            degree: _isOpen ? 0.5 : 0,
            duration: _toggleDuration,
            child:  Icon(
              Icons.expand_more,
              size: 24.0,
            ),
          ),
          horizontalTitleGap: 0.0,
          onTap: _toggle,
          title: Text(widget.text, style: TextStyle(fontSize: 20),),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: MyAnimatedSize(
            sizeFactor: _isOpen ? 1 : 0,
            duration: _toggleDuration,
            curve: Curves.easeInOut,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widget.children,
            ),
          ),
        ),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }
}
