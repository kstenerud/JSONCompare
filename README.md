JSONCompare
===========

A program to compare the speeds of various Objective-C JSON libraries.

### Latest results (on iPhone 3GS):

    2011-11-06 21:33:29.171 JSONCompare[1401:307] =============================================
    2011-11-06 21:33:29.176 JSONCompare[1401:307] ======== Beginning encode comparison ========
    2011-11-06 21:33:29.180 JSONCompare[1401:307] =============================================
    2011-11-06 21:33:29.185 JSONCompare[1401:307] Iterations: 100
    2011-11-06 21:33:29.706 JSONCompare[1401:307] Codec JSONKit    completed in 0.517
    2011-11-06 21:33:30.051 JSONCompare[1401:307] Codec KSJSON     completed in 0.342
    2011-11-06 21:33:34.027 JSONCompare[1401:307] Codec YAJL       completed in 3.973
    2011-11-06 21:33:40.789 JSONCompare[1401:307] Codec TouchJSON  completed in 6.758
    2011-11-06 21:33:45.555 JSONCompare[1401:307] Codec MTJSON     completed in 4.761
    2011-11-06 21:33:45.560 JSONCompare[1401:307] Codec SZJSON     failed
    2011-11-06 21:33:49.532 JSONCompare[1401:307] Codec SBJSON     completed in 3.968
    2011-11-06 21:34:13.013 JSONCompare[1401:307] Codec BSJSON     completed in 23.477
    2011-11-06 21:34:13.016 JSONCompare[1401:307] =============================================
    2011-11-06 21:34:13.019 JSONCompare[1401:307] =========== End encode comparison ===========
    2011-11-06 21:34:13.022 JSONCompare[1401:307] =============================================

    2011-11-06 21:34:16.904 JSONCompare[1401:307] =============================================
    2011-11-06 21:34:16.907 JSONCompare[1401:307] ======== Beginning decode comparison ========
    2011-11-06 21:34:16.910 JSONCompare[1401:307] =============================================
    2011-11-06 21:34:16.912 JSONCompare[1401:307] Iterations: 100
    2011-11-06 21:34:17.895 JSONCompare[1401:307] Codec JSONKit    completed in 0.979
    2011-11-06 21:34:18.732 JSONCompare[1401:307] Codec KSJSON     completed in 0.834
    2011-11-06 21:34:21.450 JSONCompare[1401:307] Codec YAJL       completed in 2.714
    2011-11-06 21:34:27.309 JSONCompare[1401:307] Codec TouchJSON  completed in 5.856
    2011-11-06 21:34:50.912 JSONCompare[1401:307] Codec MTJSON     completed in 23.600
    2011-11-06 21:35:06.344 JSONCompare[1401:307] Codec SZJSON     completed in 15.428
    2011-11-06 21:35:10.786 JSONCompare[1401:307] Codec SBJSON     completed in 4.439
    2011-11-06 21:35:50.270 JSONCompare[1401:307] Codec BSJSON     completed in 39.474
    2011-11-06 21:35:50.273 JSONCompare[1401:307] =============================================
    2011-11-06 21:35:50.276 JSONCompare[1401:307] =========== End decode comparison ===========
    2011-11-06 21:35:50.278 JSONCompare[1401:307] =============================================


License
=======

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall remain in place
in the source code.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
