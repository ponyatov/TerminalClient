﻿/* @file Кнопка. */

import QtQuick 1.1
import "../scenario/constants.js" 1.0 as Scenario

Item {
	id: rootItem

	// Текст
	property alias label: labelLoader.sourceComponent

	// Иконка
	property alias icon: iconLoader.sourceComponent

	// Фон
	property alias background: backgroundLoader.sourceComponent

	// Состояние
	property bool pressed

	// Состояние
	property bool disabled

	// Автоматический клик по нажатию
	property bool clickOnPress

	// Таймаут автоматического клика
	property int timeout: 200

	// Испускать сигнал не дожидаясь отжатия
	property bool signalOnPress

	// Расстояние между краем кнопки и её содержимым
	property int margin: 10

	// Сигнал нажатия
	signal clicked

	// Сигнал отжатия
	signal released

	width: backgroundLoader.item === null ? content.width : Math.max(backgroundLoader.item.sourceSize.width, content.width + rootItem.margin)
	height: backgroundLoader.item === null ? content.height : Math.max(backgroundLoader.item.sourceSize.height, content.height + rootItem.margin)

	// Фон
	Loader {
		id: backgroundLoader

		anchors.fill: parent
	}

	Row {
		id: content

		anchors.centerIn: parent

		// Иконка
		Loader {
			id: iconLoader

			anchors.verticalCenter: parent.verticalCenter
		}

		// Текст
		Loader {
			id: labelLoader

			anchors.verticalCenter: parent.verticalCenter
		}
	}

	// Обработка клика
	MouseArea {
		anchors.fill: parent

		onPressed: {
			rootItem.pressed = true;

			if (rootItem.signalOnPress) {
				rootItem.clicked();
			}

			if (rootItem.clickOnPress) {
				timer.start();
			}

			Utils.playSound(Scenario.Sound.Click2)
		}

		onReleased: {
			rootItem.pressed = false;
			rootItem.released();
		}

		onClicked: {
			if (!rootItem.clickOnPress && !rootItem.signalOnPress && !disabled) {
				rootItem.clicked();
			}
		}
	}

	Timer {
		id: timer

		interval: rootItem.timeout

		onTriggered: {
			if (!rootItem.signalOnPress) {
				rootItem.clicked();
			}
			rootItem.pressed = false;
		}
	}

	onVisibleChanged: if (!visible) rootItem.pressed = false // Сброс состояния
}
