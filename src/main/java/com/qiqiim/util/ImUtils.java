/*
 * Copyright (c) 2016, LinkedKeeper
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 * - Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * - Neither the name of LinkedKeeper nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

package com.qiqiim.util;

import io.netty.channel.ChannelHandlerContext;

import java.net.InetAddress;
import java.net.InetSocketAddress;

public class ImUtils {
    
    /**
     * byte数组转换成16进制字符串
     *
     * @param src
     * @return
     */
    public static String bytesToHexString(byte[] src) {
        StringBuilder stringBuilder = new StringBuilder();
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }
    
   
    
   /**
    * 获取IP地址及端口    
    * @param socketaddress
    * @return   {ip}:{prot}  字符串
    */
    public static String getIpAndProt(InetSocketAddress socketaddress) {
    	String address="";
        if (address != null) {
        	address=  getIp(socketaddress) + ":" + socketaddress.getPort();
        }  
        return address;
    }

    /**
     * 获取IP地址
     * @param socketaddress
     * @return  {ip} 字符串
     */
    public static String getIp(InetSocketAddress socketaddress) {
    	String ip="";
        if (socketaddress != null) {
        	 InetAddress address = socketaddress.getAddress();
        	 ip = (address == null) ? socketaddress.getHostName() : address.getHostAddress();
        } 
        return ip;
    }
    
    

    public static String getRemoteAddress(ChannelHandlerContext ctx) {
        InetSocketAddress remote = (InetSocketAddress) ctx.channel().remoteAddress();
        return getIpAndProt(remote);
    }

    public static String getLocalAddress(ChannelHandlerContext ctx) {
        InetSocketAddress local = (InetSocketAddress) ctx.channel().localAddress();
        return getIpAndProt(local);
    }

     
}