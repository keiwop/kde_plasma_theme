import QtQuick 2.5

Rectangle{
    id: root
    color: "black"
	property variant colors: ["black", "red", "green", "blue", "yellow", "cyan", "purple"]
	property int color_id: 0
    property int stage
    
//     property int grid_unit: boundingRect.height
	property real size_logo: 200
    property int circle_size: 50
    property int spacing: 100

	OpacityAnimator{
		id: anim_opacity
		running: false
		target: null
		from: 0
		to: 1
		duration: 1000
		easing.type: Easing.InCirc
	}
	
    onStageChanged:{
		switch(stage){
			case 1:
				anim_opacity.target = obj1;
				anim_opacity.running = true;
				break;
			case 2:
				anim_rotation.running = true;
				anim_opacity.target = obj2;
				anim_opacity.running = true;
				break;
			case 3:
				anim_opacity.target = obj3;
				anim_opacity.running = true;
				break;
			case 4:
				anim_opacity.target = obj3;
				anim_opacity.from = 1;
				anim_opacity.to = 0;
				anim_opacity.running = true;
				break;
			case 5:
				anim_opacity.target = obj2;
				anim_opacity.from = 1;
				anim_opacity.to = 0;
				anim_opacity.running = true;
				break;
			case 6:
				anim_opacity.target = obj1;
				anim_opacity.from = 1;
				anim_opacity.to = 0;
				anim_opacity.running = true;
				anim_rotation.running = false;
				break;
		}
	}

    MouseArea{
		id: mouse_area
		anchors.fill: parent
		onClicked: {
			root.color_id += 1;
			root.color_id %= 4;
			root.color = colors[root.color_id];
		}
	}
	
	
	Item{
		id: obj1
		anchors.fill: parent
		opacity: 0
		
		Circle{
			anchors.centerIn: parent
			color: "red"
		}
		
		Image{
			id: logo
			anchors.centerIn: parent
			anchors.verticalCenterOffset: -spacing
			opacity: 1

			source: "images/kde.svgz"
			sourceSize.width: size_logo
			sourceSize.height: size_logo

			RotationAnimator on rotation{
				id: anim_rotation
				target: logo
				running: false
				from: 0
				to: 360
				duration: 1600
				loops: Animation.Infinite
				easing.type: Easing.InOutSine
			}
		}
	}
	
	Item{
		id: obj2
		anchors.fill: parent
		opacity: 0
		
		Circle{
			anchors.centerIn: parent
			anchors.horizontalCenterOffset: -spacing
			color: "green"
		}
	
		Circle{
			anchors.centerIn: parent
			anchors.horizontalCenterOffset: spacing
			color: "green"
		}
	}
	
	Item{
		id: obj3
		anchors.fill: parent
		opacity: 0
	
		Circle{
			anchors.centerIn: parent
			anchors.horizontalCenterOffset: -spacing * 2
			color: "blue"
		}
		
		Circle{
			anchors.centerIn: parent
			anchors.horizontalCenterOffset: spacing * 2 
			color: "blue"
		}
	}
}
