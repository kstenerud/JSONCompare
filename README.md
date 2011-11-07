JSONCompare
===========

A program to compare the speeds of various Objective-C JSON libraries.

### Latest results (on iPhone 3GS):

    2011-11-06 19:18:37.587 JSONCompare[1339:307] =============================================
    2011-11-06 19:18:37.590 JSONCompare[1339:307] ======== Beginning encode comparison ========
    2011-11-06 19:18:37.593 JSONCompare[1339:307] =============================================
    2011-11-06 19:18:37.596 JSONCompare[1339:307] Iterations: 100
    2011-11-06 19:18:38.130 JSONCompare[1339:307] Codec JSONKit    completed in 0.531
    2011-11-06 19:18:38.476 JSONCompare[1339:307] Codec KSJSON     completed in 0.344
    2011-11-06 19:18:42.443 JSONCompare[1339:307] Codec YAJL       completed in 3.963
    2011-11-06 19:18:49.166 JSONCompare[1339:307] Codec TouchJSON  completed in 6.719
    2011-11-06 19:18:54.015 JSONCompare[1339:307] Codec MTJSON     completed in 4.845
    2011-11-06 19:18:54.019 JSONCompare[1339:307] Codec SZJSON     failed
    2011-11-06 19:18:57.858 JSONCompare[1339:307] Codec SBJSON     completed in 3.834
    2011-11-06 19:19:21.295 JSONCompare[1339:307] Codec BSJSON     completed in 23.433
    2011-11-06 19:19:21.300 JSONCompare[1339:307] =============================================
    2011-11-06 19:19:21.304 JSONCompare[1339:307] =========== End encode comparison ===========
    2011-11-06 19:19:21.309 JSONCompare[1339:307] =============================================

    2011-11-06 19:19:25.149 JSONCompare[1339:307] =============================================
    2011-11-06 19:19:25.152 JSONCompare[1339:307] ======== Beginning decode comparison ========
    2011-11-06 19:19:25.155 JSONCompare[1339:307] =============================================
    2011-11-06 19:19:25.158 JSONCompare[1339:307] Iterations: 100
    2011-11-06 19:19:26.143 JSONCompare[1339:307] Codec JSONKit    completed in 0.982
    2011-11-06 19:19:26.997 JSONCompare[1339:307] Codec KSJSON     completed in 0.852
    2011-11-06 19:19:29.667 JSONCompare[1339:307] Codec YAJL       completed in 2.667
    2011-11-06 19:19:35.620 JSONCompare[1339:307] Codec TouchJSON  completed in 5.948
    2011-11-06 19:19:59.031 JSONCompare[1339:307] Codec MTJSON     completed in 23.408
    2011-11-06 19:20:14.731 JSONCompare[1339:307] Codec SZJSON     completed in 15.696
    2011-11-06 19:20:19.179 JSONCompare[1339:307] Codec SBJSON     completed in 4.443
    2011-11-06 19:21:00.586 JSONCompare[1339:307] Codec BSJSON     completed in 41.401
    2011-11-06 19:21:00.591 JSONCompare[1339:307] =============================================
    2011-11-06 19:21:00.597 JSONCompare[1339:307] =========== End decode comparison ===========
    2011-11-06 19:21:00.603 JSONCompare[1339:307] =============================================


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
