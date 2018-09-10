import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

import ".."
import "../lib"

ConfigPage {
	id: page
	showAppletVersion: true

	ConfigSection {
		title: i18n("Size")

		RowLayout{
			ConfigSpinBox {
				configKey: "width"
				suffix: i18n("px")
			}
			Label {
				text: i18n(" by ")
			}
			ConfigSpinBox {
				configKey: "height"
				suffix: i18n("px")
			}
		}
		
	}

	
	ConfigSection {
		title: i18n("Options")

		ConfigCheckBox {
			configKey: "showInPopup"
			text: i18n("Show In Popup: Relog after enabling to fix issues.")
		}

		ConfigCheckBox {
			configKey: "volumeChangeFeedback"
			text: i18n("Volume Feedback: Play popping noise when changing the volume.")
		}
	}

	ConfigSection {
		ConfigSpinBox {
			id: volumeUpDownSteps
			configKey: "volumeUpDownSteps"
			minimumValue: 1
			before: i18n("Volume Up/Down Steps:")
			
			property int oneStep: 1
			after: i18n("One step = %1%", oneStep)
			Component.onCompleted: {
				// If we bind to "value" in the property, it will still be the slider default of 0,
				// causing a 1/0 error. This breaks the binding. So we bind after value updates.
				oneStep = Qt.binding(function() { return Math.round(1/volumeUpDownSteps.value * 100) })
			}
		}
	}
}
