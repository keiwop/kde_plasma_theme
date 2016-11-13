import QtQuick 2.5

Rectangle{
	property int circle_size: 50
    property int spacing: 100

	anchors.verticalCenterOffset: spacing
	opacity: 1
	width: circle_size
	height: width
	radius: width * 0.5
}
