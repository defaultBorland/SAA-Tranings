#include "Base_Classes.hpp"

class Text: RscText {
	access = 0;
	type = CT_STATIC;
	idc = -1;
	style = 2;
	w = 0.1; h = 0.05;
	font = "EtelkaMonospacePro";
	sizeEx = 0.04;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	text = "";
	fixedWidth = 0;
	shadow = 0;
	lineSpacing = 1;
};

class arsenalGenUI {
	movingEnable = 1;
	idd = 10001;
	onLoad = "_this ExecVM 'Arsenal\arsenalGenUI.sqf'";
	class controlsBackground {
		class Mainback : RscPicture {
			x = 0.04;
			y = 0.01;
			w = 1;
			h = 0.32;
			moving = 1;
			text = "#(argb,8,8,3)color(0,0,0,0.8)";
		};
	};
	class controls {
		class mainHeader: Text {
			idc = 2099;
			x = 0.08;
			y = 0.02;
			w = 0.92;
			sizeEx = 0.04;
			font = "PuristaBold";
			text = "Выберите основной/дополнительный класс в соответствии с данными в таблице.";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};

		class firstClassHeader: Text {
			idc = 2102;
			x = 0.15;
			y = 0.07;
			w = 0.3;
			font = "RobotoCondensed";
			text = "Основной класс:";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};

		class secondClassHeader: Text {
			idc = 2103;
			x = 0.55;
			y = 0.07;
			w = 0.4;
			font = "RobotoCondensed";
			text = "Вторичный (При отсутствии указать - НЕДОСТУПНО):";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};

		class comboA: RscCombo {
			idc = 2100;
			x = 0.15;
			w = 0.3;
			y = 0.127;

			class ComboScrollBar {};
		};

		class comboB: RscCombo {
			idc = 2101;
			x = 0.6;
			w = 0.3;
			y = 0.127;

			class ComboScrollBar {};
		};

		class description: Text {
			idc = 2104;
			style = 2;
			colorDisabled[] = {1,1,1,1}; 
			colorBackground[] = {0,0,0,0}; 
			x = 0.1;
			y = 0.19;
			w = 0.85;
			h = 0.05;
			text = "Текст";
		};

		class applyButton: RscButton {
			idc = 2106;
			text = "Сгенерировать арсенал";
			colorBackground[] = { 0, 0, 0, 0.3 };
			x = 0.1;
			y = 0.26;
			w = 0.9;
			h = 0.05;
		};
	};
};