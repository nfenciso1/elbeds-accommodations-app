import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../UI_parameters.dart' as UIParameter;
import '../classes.dart';
import 'dart:typed_data';

class AccomCard extends StatefulWidget {
  /* Accom Card will accept an object that will contain
    - Accom ID
    - Accom name
    - Accom description
    - Accom rating
  */

  const AccomCard({Key? key, required this.details}) : super(key: key);
  final AccomCardDetails details;

  @override
  State<AccomCard> createState() => _AccomCardState();
}

class _AccomCardState extends State<AccomCard> {
  // TO-DO: the calling screen/component should get these details from DB and pass it to accom_card as an argument
  // temporary holders to determine if user is admin
  var isAdmin = false;
  // temporary holders to determine if post is part of user's favorite, or part of admin's archived accomms
  var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width - 40,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: UIParameter.CARD_BORDER_RADIUS,
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          // box shadow to get elevation effect
          const BoxShadow(
              color: Color.fromARGB(255, 177, 177, 177),
              blurRadius: 3,
              offset: Offset(3, 5))
        ],
      ),
      // InkWell so card has onTap property
      child: InkWell(
        onTap: () {
          // For now, redirect to sign up page.
          // if (widget.details.ID is in the list of the signed in user's owned accomms) {
          //   Navigator.pushNamed(context, '/owned/accomm');
          // } else {
          Navigator.pushNamed(context, '/accomm',
              arguments: widget.details.getID());
          // }
        },
        child: Row(
          children: [
            // 2 Sized boxes to split the card in half
            // left side for image
            // right side for name, description, and rating
            SizedBox(
              width: (MediaQuery.of(context).size.width - 40) / 2,
              height: 200,
              child: ClipRRect(
                  // round the left edges of the image to match the card
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.memory(Uri.parse(widget.details.getImage())
                          .data!
                          .contentAsBytes()))),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width - 40) / 2,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.details.getName(),
                      style: const TextStyle(
                          fontSize: UIParameter.FONT_HEADING_SIZE,
                          fontFamily: UIParameter.FONT_REGULAR,
                          // w600 is semibold
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Text(
                        widget.details.getDescription(),
                        style: const TextStyle(
                            fontSize: UIParameter.FONT_BODY_SIZE,
                            fontFamily: UIParameter.FONT_REGULAR),
                      ),
                    ),
                    // if admin only display rating
                    isAdmin
                        ? RatingBar.builder(
                            minRating: 0,
                            maxRating: 5,
                            initialRating: widget.details.getRating(),
                            direction: Axis.horizontal,
                            allowHalfRating: false,

                            // ignore gestures to make rating un-editable
                            ignoreGestures: true,
                            onRatingUpdate: (rating) {
                              /* CANNOT RATE HERE */
                            },
                            itemSize: 18,
                            itemBuilder: (BuildContext context, int index) =>
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ))
                        // else add favorite icon
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RatingBar.builder(
                                  minRating: 0,
                                  maxRating: 5,
                                  initialRating: widget.details.getRating(),
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,

                                  // ignore gestures to make rating un-editable
                                  ignoreGestures: true,
                                  onRatingUpdate: (rating) {
                                    /* CANNOT RATE HERE */
                                  },
                                  itemSize: 18,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          )),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                      // TODO: add or remove accommodation from favorites of user in DB
                                    });
                                  },
                                  // check if part of favorite accomms
                                  child: isFavorite
                                      ? Icon(
                                          Icons.favorite,
                                          color: UIParameter.MAROON,
                                          size: 18,
                                        )
                                      : const Icon(
                                          Icons.favorite_outline_rounded,
                                          color: Colors.grey,
                                          size: 18,
                                        ))
                            ],
                          )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
