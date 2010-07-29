package org.flixel
{
	/**
	 * The sole purpose of this class is to minimize external dependencies in order not to unnecessarily bloat up the game.
	 * These vales are queried for in the preloader after all.
	 */
	public class FlxVersion
	{
		/**
		 * If you build and maintain your own version of flixel,
		 * you can give it your own name here.  Appears in the console.
		 */
		static public var LIBRARY_NAME:String = "flixel";
		/**
		 * Assign a major version to your library.
		 * Appears before the decimal in the console.
		 */
		static public var LIBRARY_MAJOR_VERSION:uint = 2;
		/**
		 * Assign a minor version to your library.
		 * Appears after the decimal in the console.
		 */
		static public var LIBRARY_MINOR_VERSION:uint = 43;
		
		
		
		static private var _isDebugModeSet:Boolean;
		static private var _debugMode:Boolean;
		
		/**
		 * Whether the game is running in debug or release mode. Used by primarily by <code>FlxPreloader</code>.
		 * <code>FlxGame</code> sets <code>FlxG</code>'s debug flag using this function - this is left in for backwards compatibility.
		 */
		public static function get debugMode():Boolean
		{
			if (!_isDebugModeSet)
			{
				_isDebugModeSet = true;
				
				//Check if we are on debug or release mode and set _DEBUG accordingly
				try
				{
					throw new Error("Setting global debug flag...");
				}
				catch(e:Error)
				{
					var re:RegExp = /\[.*:[0-9]+\]/;
					_debugMode = re.test(e.getStackTrace());
				}
			}
			
			return _debugMode;
		}
	}
}