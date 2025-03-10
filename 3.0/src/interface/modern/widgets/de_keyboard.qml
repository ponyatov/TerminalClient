﻿/* @file Немецкая раскладка клавиатуры. */

import QtQuick 1.1
import "../controls" 1.0 as Controls

Controls.KeyboardBase {
	id: rootItem

	// Текст кнопки CapsLock
	property string capsLockLabel

	// Текст левой доп. кнопки
	property string leftAltLabel

	// Текст правой доп. кнопки
	property string rightAltLabel

	// Нажат CapsLock
	signal capsLockClicked

	// Нажата левая дополнительная кнопка
	signal leftAltClicked

	// Нажата правая дополнительная кнопка
	signal rightAltClicked

	name: "Eng"
	code: "en"
	altMode: true

	Column {
		anchors.top: parent.top
		anchors.topMargin: 10

		Row {
			property alias handler: rootItem
			anchors.horizontalCenter: parent.horizontalCenter

			KeyboardButton { text: _("q") }
			KeyboardButton { text: _("w") }
			KeyboardButton { text: _("e") }
			KeyboardButton { text: _("r") }
			KeyboardButton { text: _("t") }
			KeyboardButton { text: _("z") }
			KeyboardButton { text: _("u") }
			KeyboardButton { text: _("i") }
			KeyboardButton { text: _("o") }
			KeyboardButton { text: _("p") }
			KeyboardButton { text: _("ü") }
			KeyboardButton { text: _("1"); altText: _("!"); backgroundSource: "button.function" }
			KeyboardButton { text: _("2"); altText: _("/"); backgroundSource: "button.function" }
			KeyboardButton { text: _("3"); altText: _("#"); backgroundSource: "button.function" }
		}
		Row {
			property alias handler: rootItem
			anchors.horizontalCenter: parent.horizontalCenter

			KeyboardButton { text: _("a") }
			KeyboardButton { text: _("s") }
			KeyboardButton { text: _("d") }
			KeyboardButton { text: _("f") }
			KeyboardButton { text: _("g") }
			KeyboardButton { text: _("h") }
			KeyboardButton { text: _("j") }
			KeyboardButton { text: _("k") }
			KeyboardButton { text: _("l") }
			KeyboardButton { text: _("ö") }
			KeyboardButton { text: _("ä") }
			KeyboardButton { text: _("4"); altText: _("$"); backgroundSource: "button.function" }
			KeyboardButton { text: _("5"); altText: _("%"); backgroundSource: "button.function" }
			KeyboardButton { text: _("6"); altText: _("^"); backgroundSource: "button.function" }
		}
		Row {
			property alias handler: rootItem
			anchors.horizontalCenter: parent.horizontalCenter

			KeyboardButton { text: _("y") }
			KeyboardButton { text: _("x") }
			KeyboardButton { text: _("c") }
			KeyboardButton { text: _("v") }
			KeyboardButton { text: _("b") }
			KeyboardButton { text: _("n") }
			KeyboardButton { text: _("m") }
			KeyboardButton { text: _("@"); backgroundSource: "button.function"}
			KeyboardButton { text: _("."); backgroundSource: "button.function" }
			Spacer { width: 86 }
			KeyboardButton { text: _("ß") }
			KeyboardButton { text: _("7"); altText: _("&"); backgroundSource: "button.function" }
			KeyboardButton { text: _("8"); altText: _("*"); backgroundSource: "button.function" }
			KeyboardButton { text: _("9"); altText: _("_"); backgroundSource: "button.function" }
		}
		Row {
			property alias handler: rootItem
			anchors.horizontalCenter: parent.horizontalCenter

			KeyboardButton { width: 258; iconId: 12; backgroundSource: "button.function"; disabled: false; onClicked: { altMode = false; rootItem.rightAltClicked() } }
			KeyboardButton { width: 344; text: _(" "); iconId: 34; key: Qt.Key_Space }
			KeyboardButton { width: 258; iconId: 33; disabled: false; onClicked: altMode = !altMode;  background: BorderImage { border { left: 40; top: 40; right: 40; bottom: 40 } source: altMode ? Utils.ui.image("button.function.pressed") : Utils.ui.image("button.function.normal") } }
			KeyboardButton { text: _("-"); altText: _("("); backgroundSource: "button.function" }
			KeyboardButton { text: _("0"); altText: _(")"); backgroundSource: "button.function" }
			KeyboardButton { width: 170; key: Qt.Key_Backspace; iconId: 36; backgroundSource: "button.function"; disabled: false }
		}
	}
}
