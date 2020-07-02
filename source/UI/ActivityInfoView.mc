using Toybox.WatchUi as Ui;
using Toybox.Timer;
using Toybox.Graphics as Gfx;

using VibrationController as Vib;
using ViewDrawables as draw;
using TimerHandler;

class ActivityInfoView extends Ui.View {
    const CALLBACK_TIMER = 100;

    static var updateTimer;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
        TimerHandler.startUpdateTimer();
    }

    // Update the view
    function onUpdate(dc) {
        drawScreen(dc);
        Vib.handleVibration();
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {

    }

    // Control function for main display panel
    function drawScreen(dc) {
        draw.clearScreen(dc);

        drawDividers(dc);
        draw.gpsRing(dc);


    }

    ///////////////////////////////////////////////////////////////////////////////
    // Functions for drawing                                                     //
    ///////////////////////////////////////////////////////////////////////////////
    function drawDividers(dc) {
        var color  = Gfx.COLOR_WHITE;
        var x      = draw.getMidWidth(dc);
        var y      = draw.getMidHeight(dc);
        var length = dc.getWidth();

        draw.hDivider(color, x, y, length, dc);
        draw.vDivider(color, x, y, length, dc);
    }
}