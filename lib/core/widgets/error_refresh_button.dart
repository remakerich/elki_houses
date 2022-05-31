import 'package:elki_houses/core/ui.dart';
import 'package:flutter/material.dart';

class ErrorRefreshButton extends StatelessWidget {
  const ErrorRefreshButton({
    this.onTap,
    required this.errorMessage,
    Key? key,
  }) : super(key: key);

  final String errorMessage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(kOutsideGap),
          child: Text(
            errorMessage,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(47),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: 40,
                width: 230,
                color: kPrimaryColor,
                child: Text(
                  'Обновить',
                  style: kPrimaryStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    highlightColor: Colors.white.withOpacity(0.5),
                    splashColor: Colors.white.withOpacity(0.5),
                    onTap: onTap,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
