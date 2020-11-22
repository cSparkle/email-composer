package com.cSparkle.emailcomposer;

import android.content.Intent;
import android.os.Parcelable;
import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.getcapacitor.NativePlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import java.util.List;
import org.json.JSONException;

@NativePlugin
public class EmailComposer extends Plugin {

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", value);
        call.success(ret);
    }

    private String[] getArray(JSArray array) {
        int size = array.length();
        String[] newList = new String[size];
        try {
            List<String> emails = array.toList();
            int count = 0;
            for (String email : emails) {
                newList[count] = email;
                count++;
            }
            return newList;
        } catch (JSONException e) {
            return newList;
        }
    }

    @PluginMethod
    public void openEmail(PluginCall call) {
        Intent draft = new Intent(Intent.ACTION_SEND);
        JSArray recipients = call.getArray("to");
        String subject = call.getString("subject");
        String body = call.getString("body");

        draft.putExtra(Intent.EXTRA_EMAIL, getArray(recipients));
        draft.putExtra(Intent.EXTRA_SUBJECT, subject);
        draft.putExtra(Intent.EXTRA_TEXT, body);
        draft.setType("text/html");
        this.getContext().startActivity(Intent.createChooser(draft, "Send mail"));
    }
}
