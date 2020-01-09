package vn.edu.nlu.fit.util;

import java.io.*;
import java.net.*;
import java.util.*;
import javax.naming.*;
import javax.naming.directory.*;

public class CheckMail {

    private static int hear(BufferedReader in) throws IOException {
        String line = null;
        int res = 0;
        while ((line = in.readLine()) != null) {
            String pfx = line.substring(0, 3);
            try {
                res = Integer.parseInt(pfx);
            } catch (Exception ex) {
                res = -1;
            }
            if (line.charAt(3) != '-') break;
        }
        return res;
    }

    private static void say(BufferedWriter wr, String text) throws IOException {
        wr.write(text + "\r\n");
        wr.flush();
        return;
    }

    private static ArrayList getMX(String hostName)
            throws NamingException {
        Hashtable env = new Hashtable();
        env.put("java.naming.factory.initial",
                "com.sun.jndi.dns.DnsContextFactory");
        DirContext ictx = new InitialDirContext(env);
        Attributes attrs = ictx.getAttributes
                (hostName, new String[]{"MX"});
        Attribute attr = attrs.get("MX");
        if ((attr == null) || (attr.size() == 0)) {
            attrs = ictx.getAttributes(hostName, new String[]{"A"});
            attr = attrs.get("A");
            if (attr == null)
                throw new NamingException
                        ("No match for name '" + hostName + "'");
        }
        ArrayList res = new ArrayList();
        NamingEnumeration en = attr.getAll();
        while (en.hasMore()) {
            String x = (String) en.next();
            String f[] = x.split(" ");
            if (f[1].endsWith("."))
                f[1] = f[1].substring(0, (f[1].length() - 1));
            res.add(f[1]);
        }
        return res;
    }

    public static boolean isMailAddressValid(String address) {
        int pos = address.indexOf('@');
        if (pos == -1) return false;
        String domain = address.substring(++pos);
        ArrayList mxList = null;
        try {
            mxList = getMX(domain);
        } catch (NamingException ex) {
            return false;
        }
        if (mxList.size() == 0) return false;
        for (int mx = 0; mx < mxList.size(); mx++) {
            boolean valid = false;
            try {
                int res;
                Socket skt = new Socket((String) mxList.get(mx), 25);
                BufferedReader rdr = new BufferedReader
                        (new InputStreamReader(skt.getInputStream()));
                BufferedWriter wtr = new BufferedWriter
                        (new OutputStreamWriter(skt.getOutputStream()));
                res = hear(rdr);
                if (res != 220) throw new Exception("Invalid header");
                say(wtr, "EHLO orbaker.com");
                res = hear(rdr);
                if (res != 250) throw new Exception("Not ESMTP");
                say(wtr, "MAIL FROM: <tim@orbaker.com>");
                res = hear(rdr);
                if (res != 250) throw new Exception("Sender rejected");
                say(wtr, "RCPT TO: <" + address + ">");
                res = hear(rdr);
                say(wtr, "RSET");
                hear(rdr);
                say(wtr, "QUIT");
                hear(rdr);
                if (res != 250)
                    throw new Exception("Address is not valid!");
                valid = true;
                rdr.close();
                wtr.close();
                skt.close();
            } catch (Exception ex) {
            } finally {
                if (valid) return true;
            }
        }
        return false;
    }
}