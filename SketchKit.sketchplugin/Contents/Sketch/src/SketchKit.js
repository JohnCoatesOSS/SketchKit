var SketchKitContext = null;

var loadSketchKit = function(context) {
  SketchKitContext = context;

  if (loadCSSketchAsNeeded()) {
    var testController = SKKTestController.sharedInstance();
    testController.testWithContext(context);
  }
}

function loadCSSketchAsNeeded() {
  if (!NSClassFromString("CSKFileMonitor")) {
    if (!loadBundle("CSSketch Helper.bundle")) {
      log("Couldn't load bundle!");
      return false;
    }
  }

  return true;
}

function loadBundle(filename) {
  var pluginURL = pluginPathURL();
  var bundleURL = pluginURL.URLByAppendingPathComponent(filename);
  var bundle = [NSBundle bundleWithURL: bundleURL];
	if (!bundle) {
		showNotification("Bundle missing!");
		return false;
	}

	var loaded = [bundle load];
	if (!loaded) {
		showNotification("Couldn't load CSSketch bundle! Try allowing apps downloaded from anywhere (System Preferences -> Security & Privacy)");
    return false;
	}

	return loaded;
}

function pluginPathURL() {
  return SketchKitContext.plugin.url();
}

function showNotification(message) {
  // NSUserNotification only shows if app is in-active
  var notification =  [[NSUserNotification alloc] init];
  notification.title = @"CSSketch";
  notification.informativeText = message;
  notification.soundName = NSUserNotificationDefaultSoundName;
  [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];

  // displayMessage only shows if app is active
  SketchKitContext.document.displayMessage("CSSketch: "+ message);
}
