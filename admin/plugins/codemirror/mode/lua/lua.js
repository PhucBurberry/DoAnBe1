romotion guardrail_report_prob  �hp�   	�           model_and_user_decline_report_prob      �hp�   8�           max_days_to_store_guardrails    �hp�   x�   <       UniversalInstallManifest UniversalInstallIcon    ip�    ���   0       UniversalInstallDefaultUrl      ffffff@���   {Ǎ   ���   ׍   \�   �׍   q��X��X��������  ..\..\components\webapps\browser\installable\installable_icon_fetcher.cc OnFaviconFetched Webapp.Install.FaviconSize ProcessFaviconInBackground        Page is not served from a secure origin Page has no manifest <link> URL The manifest could not be fetched, parsed, or the document is on an opaque origin.      Manifest start URL is not valid Manifest does not contain a 'name' or 'short_name' field        Manifest 'display' property must be one of 'standalone', 'fullscreen', or 'minimal-ui'          Manifest does not contain a suitable icon - PNG, SVG or WebP format of at least %dpx is required, the sizes attribute must be set, and the purpose attribute, if set, must include "any" or "maskable". No supplied icon is at least %dpx square in PNG, SVG or WebP format     Could not download a required icon from the manifest    Downloaded icon was empty or corrupted  The specified application platform is not supported on Android  No Play store ID provided       The Play Store app URL and Play Store ID do not match   The app is already installed    A URL in the manifest contains a username, password, or port    Page is loaded in an incognito window   Page does not work offline      Could not check service worker without a 'start_url' field in the manifest      Manifest specifies prefer_related_applications: true    prefer_related_applications is only supported on Chrome Beta and Stable channels on Android.    Manifest location changed during fetch  Manifest contains 'display_override' field, and the first supported display mode must be one of 'standalone', 'fullscreen', or 'minimal-ui'     Web app uninstalled so that it stops any running pipeline       not-from-secure-origin  manifest-parsing-or-network-error       start-url-not-valid     manifest-missing-name-or-short-name     manifest-display-not-supported  manifest-missing-suitable-icon  minimum-icon-size-in-pixels     no-acceptable-icon      cannot-download-icon    no-icon-available       platform-not-supported-on-android       ids-do-not-match        already-installed       url-not-supported-for-webapk    not-offline-capable     no-url-for-service-worker       prefer-related-applications     prefer-related-applications-only-beta-stable    manifest-location-changed       manifest-display-override-not-supported pipeline-restarted Site cannot be installed:    %���Ț������d���������*�������������͛���������s��������������������������������4����������������������Ԛ����������������������������K�����������q���O���7�������������ݜ������؞������f������������������������4���)�����������������������������������������������..\..\components\webapps\browser\installable\installable_manager.cc OnTaskFinished menu browser tab menu custom tab automatic prompt browser tab automatic prompt custom tab api browser tab api custom tab management api ambient badge browser tab ambient badge custom tab arc internal default external default external policy system default omnibox install icon menu create shortcut sub app chrome service rich install ui weblayer isolated web app: graphical installer isolated web app: dev command line isolated web app: dev UI isolated web app: external policy isolated web app: shimless RMA external lock screen preloaded oem microsoft 365 setup profile menu ml promotion preloaded default app install uri webapk restore oobe app recommendations preinstalled default preinstalled system preinstalled system from sync preinstalled store preinstalled store from sync ntp menu microsoft count AppMenu AppsPage OS Settings App Management Migration App List Shelf Internal Preinstalled External Preinstalled External Policy System Preinstalled Placeholder Replacement Arc Startup Cleanup Parent App Uumber";
    }
    if (/[\w_]/.test(ch)) {
      stream.eatWhile(/[\w\\\-_.]/);
      return "variable";
    }
    return null;
  }

  function bracketed(level, style) {
    return function(stream, state) {
      var curlev = null, ch;
      while ((ch = stream.next()) != null) {
        if (curlev == null) {if (ch == "]") curlev = 0;}
        else if (ch == "=") ++curlev;
        else if (ch == "]" && curlev == level) { state.cur = normal; break; }
        else curlev = null;
      }
      return style;
    };
  }

  function string(quote) {
    return function(stream, state) {
      var escaped = false, ch;
      while ((ch = stream.next()) != null) {
        if (ch == quote && !escaped) break;
        escaped = !escaped && ch == "\\";
      }
      if (!escaped) state.cur = normal;
      return "string";
    };
  }

  return {
    startState: function(basecol) {
      return {basecol: basecol || 0, indentDepth: 0, cur: normal};
    },

    token: function(stream, state) {
      if (stream.eatSpace()) return null;
      var style = state.cur(stream, state);
      var word = stream.current();
      if (style == "variable") {
        if (keywords.test(word)) style = "keyword";
        else if (builtins.test(word)) style = "builtin";
        else if (specials.test(word)) style = "variable-2";
      }
      if ((style != "comment") && (style != "string")){
        if (indentTokens.test(word)) ++state.indentDepth;
        else if (dedentTokens.test(word)) --state.indentDepth;
      }
      return style;
    },

    indent: function(state, textAfter) {
      var closing = dedentPartial.test(textAfter);
      return state.basecol + indentUnit * (state.indentDepth - (closing ? 1 : 0));
    },

    electricInput: /^\s*(?:end|until|else|\)|\})$/,
    lineComment: "--",
    blockCommentStart: "--[[",
    blockCommentEnd: "]]"
  };
});

CodeMirror.defineMIME("text/x-lua", "lua");

});
