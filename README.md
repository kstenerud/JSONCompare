JSONCompare
===========

A program to compare the speeds of various Objective-C JSON libraries.

### Latest results (on iPhone 3GS):

    2011-10-30 21:48:52.719 JSONCompare[3714:307] =============================================
    2011-10-30 21:48:52.728 JSONCompare[3714:307] ======== Beginning encode comparison ========
    2011-10-30 21:48:52.730 JSONCompare[3714:307] =============================================
    2011-10-30 21:48:52.733 JSONCompare[3714:307] Iterations: 100
    2011-10-30 21:48:53.263 JSONCompare[3714:307] Codec JSONKit    completed in 0.520
    2011-10-30 21:48:53.638 JSONCompare[3714:307] Codec KSJSON     completed in 0.371
    2011-10-30 21:48:57.467 JSONCompare[3714:307] Codec YAJL       completed in 3.825
    2011-10-30 21:49:04.057 JSONCompare[3714:307] Codec TouchJSON  completed in 6.585
    2011-10-30 21:49:08.749 JSONCompare[3714:307] Codec MTJSON     completed in 4.687
    2011-10-30 21:49:08.752 JSONCompare[3714:307] Codec SZJSON     failed
    2011-10-30 21:49:12.481 JSONCompare[3714:307] Codec SBJSON     completed in 3.726
    2011-10-30 21:49:35.391 JSONCompare[3714:307] Codec BSJSON     completed in 22.907
    2011-10-30 21:49:35.394 JSONCompare[3714:307] =============================================
    2011-10-30 21:49:35.397 JSONCompare[3714:307] =========== End encode comparison ===========
    2011-10-30 21:49:35.399 JSONCompare[3714:307] =============================================
    
    2011-10-30 21:49:39.156 JSONCompare[3714:307] =============================================
    2011-10-30 21:49:39.158 JSONCompare[3714:307] ======== Beginning decode comparison ========
    2011-10-30 21:49:39.166 JSONCompare[3714:307] =============================================
    2011-10-30 21:49:39.169 JSONCompare[3714:307] Iterations: 100
    2011-10-30 21:49:40.165 JSONCompare[3714:307] Codec JSONKit    completed in 0.992
    2011-10-30 21:49:42.527 JSONCompare[3714:307] Codec KSJSON     completed in 2.356
    2011-10-30 21:49:45.233 JSONCompare[3714:307] Codec YAJL       completed in 2.704
    2011-10-30 21:49:51.190 JSONCompare[3714:307] Codec TouchJSON  completed in 5.953
    2011-10-30 21:50:15.363 JSONCompare[3714:307] Codec MTJSON     completed in 24.170
    2011-10-30 21:50:30.638 JSONCompare[3714:307] Codec SZJSON     completed in 15.271
    2011-10-30 21:50:34.996 JSONCompare[3714:307] Codec SBJSON     completed in 4.355
    2011-10-30 21:51:14.769 JSONCompare[3714:307] Codec BSJSON     completed in 39.769
    2011-10-30 21:51:14.772 JSONCompare[3714:307] =============================================
    2011-10-30 21:51:14.774 JSONCompare[3714:307] =========== End decode comparison ===========
    2011-10-30 21:51:14.777 JSONCompare[3714:307] =============================================


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
