
import 'package:flutter/widgets.dart';

const num WATER_ACTUAL = 1;
const num MILK_ACTUAL = 3.4;
const num TEA_POWDER_ACTUAL = 1;
const num SUGAR_ACTUAL = 1;

const String ANS_BLACK_TEA = "Black Tea Ready!";
const String ANS_SUGAR_HIGH = "Here's your tea with sugar high!";
const String ANS_SUGAR_LOW = "Here's your low-sugar Diabetic Tea";
const String ANS_PERFECT_MILK_TEA = "This is a perfect milk tea! ";
const String ANS_LIGHT_TEA = "This is not how a perfect tea should look like!";

final TextEditingController waterController = TextEditingController(text: "0");

final TextEditingController milkController = TextEditingController(text: "0");

final TextEditingController teaPowderController =
TextEditingController(text: "0");

final TextEditingController sugarController = TextEditingController(text: "0");
String messageText = 'START';