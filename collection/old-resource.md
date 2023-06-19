# OLD-RESOURCE.CVSV

This file controls whether a resource is processed or not.

Columns: old-resource,status,resource,notes 

If a resource entry is listed in  this file, then the resource will not be processed. See method `dataset_resource_map` in `src/digital-land/digital_land/collection.py`, for how this is used.

## 2023 Jun 19

There's been an ongoing issue with  the listed buildingds collection on the CI box. The error reported is shown below

        call-workflow / build
        Unhandled exception. System.IO.IOException: No space left on device : '/home/runner/runners/2.304.0/_diag/Worker_20230618-001748-utc.log' at System.IO.RandomAccess.WriteAtOffset(SafeFileHandle handle, ReadOnlySpan`1 buffer, Int64 fileOffset) at System.IO.Strategies.BufferedFileStreamStrategy.FlushWrite() at System.IO.StreamWriter.Flush(Boolean flushStream, Boolean flushEncoder) at System.Diagnostics.TextWriterTraceListener.Flush() at System.Diagnostics.TraceSource.Flush() at GitHub.Runner.Common.TraceManager.Dispose(Boolean disposing) at GitHub.Runner.Common.TraceManager.Dispose() at GitHub.Runner.Common.HostContext.Dispose(Boolean disposing) at GitHub.Runner.Common.HostContext.Dispose() at GitHub.Runner.Worker.Program.Main(String[] args) System.IO.IOException: No space left on device : '/home/runner/runners/2.304.0/_diag/Worker_20230618-001748-utc.log' at System.IO.RandomAccess.WriteAtOffset(SafeFileHandle handle, ReadOnlySpan`1 buffer, Int64 fileOffset) at System.IO.Strategies.BufferedFileStreamStrategy.FlushWrite() at System.IO.Strategies.BufferedFileStreamStrategy.WriteSpan(ReadOnlySpan`1 source, ArraySegment`1 arraySegment) at System.IO.StreamWriter.Flush(Boolean flushStream, Boolean flushEncoder) at System.Diagnostics.TextWriterTraceListener.Flush() at GitHub.Runner.Common.HostTraceListener.WriteHeader(String source, TraceEventType eventType, Int32 id) at GitHub.Runner.Common.HostTraceListener.TraceEvent(TraceEventCache eventCache, String source, TraceEventType eventType, Int32 id, String message) at System.Diagnostics.TraceSource.TraceEvent(TraceEventType eventType, Int32 id, String message) at GitHub.Runner.Worker.Worker.RunAsync(String pipeIn, String pipeOut) at GitHub.Runner.Worker.Program.MainAsync(IHostContext context, String[] args) System.IO.IOException: No space left on device : '/home/runner/runners/2.304.0/_diag/Worker_20230618-001748-utc.log' at System.IO.RandomAccess.WriteAtOffset(SafeFileHandle handle, ReadOnlySpan`1 buffer, Int64 fileOffset) at System.IO.Strategies.BufferedFileStreamStrategy.FlushWrite() at System.IO.Strategies.BufferedFileStreamStrategy.WriteSpan(ReadOnlySpan`1 source, ArraySegment`1 arraySegment) at System.IO.StreamWriter.Flush(Boolean flushStream, Boolean flushEncoder) at System.Diagnostics.TextWriterTraceListener.Flush() at GitHub.Runner.Common.HostTraceListener.WriteHeader(String source, TraceEventType eventType, Int32 id) at GitHub.Runner.Common.HostTraceListener.TraceEvent(TraceEventCache eventCache, String source, TraceEventType eventType, Int32 id, String message) at System.Diagnostics.TraceSource.TraceEvent(TraceEventType eventType, Int32 id, String message) at GitHub.Runner.Common.Tracing.Error(Exception exception) at GitHub.Runner.Worker.Program.MainAsync(IHostContext context, String[] args)

Though we have also seen errors pointing to a comms error as well as timeouts after six hours.

Paul Downey has suggested applying a gambit to reduce the amount of processing rrquired in the hope that this will unstick it. This has worked before.

He suggests that this query returns items to add to the old-resource file:

https://datasette.planning.data.gov.uk/digital-land?sql=select%0D%0A++resource.resource%2C%0D%0A++resource.start_date%0D%0Afrom%0D%0A++resource_endpoint%2C%0D%0A++resource%0D%0Awhere%0D%0A++%22endpoint%22+%3D+%3Aendpoint%0D%0A++and+resource.resource+%3D+resource_endpoint.resource%0D%0Aorder+by%0D%0A++start_date&endpoint=c187fc319f7175f30f123c26cd74e398844b0176b3e5c1690f2d710ef1cb237f

Which returns

|resource |start_date |
| --- | --- |
|ebf9e1df4e638a318b6d79335c27c896c77dfcf3c2592cdb75d419f3d50362f2| 2021-05-28|
|d9a44a4c68c0014b510ae66fadadc79144903a35cabacd05aacd4cd7ab76eed3| 2021-06-01|
|8e9203bc60c1d387cc6e0e490bbb4c94f030e8a303c9d160a8c4fdbf30e9c1d2| 2021-06-30|
|1694666a7c7c606facc6c48aa71f46304ce0ff3c209d284ccee874b3d9f65930| 2021-08-01|
|cec379cc7a1a380a9e8eb9405c1cce705d3bcb47021a78208ca98d1cc6394543| 2021-08-13|
|e91b0bb16528f378857762aaad27b2afd8be0cfb04fc85db57c6e57fd0bbe47c| 2021-08-31|
|5af0bf40fd2d02f7a842cdbdd906ce081e3cefa20b4858803b4493c57bbf1633| 2021-09-09|
|0ad1b811a6287d3ff6a3101fdf84b5766d020dfd4185251e40eb2057ed170659| 2021-10-01|
|018ca4c84ac8067646897b93e5b811573b5fe6dbe4120b635afa4b3198f3ca9e| 2021-10-12|
|6e3768c08262b47803d8847cade830602a60b4c23f41036b2da68e8d8b7e997e| 2021-10-26|
|b18545a6e856c19a910ef34077e6db3c394cbb489b0b90d31863bdbddaaf3dad| 2021-11-09|
|dce42dea0670bc7b4f5c209c6a91e5b6a6d59673655325989d21b53e476bfdfb| 2021-11-23|
|13bece8137e20f30e2e569be0a249e7210ea6f9178d77253353bd8b5cace3974| 2021-12-03|
|a5e052cff237fdb066a25284608249ff74309c5a41aadbfcdf70f762690b3dcf| 2021-12-17|
|08c95c1c9a9a0594a149eb7a65158e881143f92f96a6e32f5ee3822cf00a0ed9| 2022-01-05|
|4d2a9909b22782366c46cd46410fe9eb26ce3dbfcfc852f2baf14b714bc2aac7| 2022-01-13|
|f9b45adf7b8f63788cb62db450ac399a33e9e01d1de0b8a5d01d13412d679190| 2022-02-11|
|50d69dc421bb399b94d05b9a9d875bf33c92dbe53899151ce14ef4dbc111134c| 2022-02-25|
|c314dea507e60fc6d231b1a3dd3b08568a0d33426e541f3b1b4c183f22f0050b| 2022-03-11|
|7ebd86943e1ae71e582a050ef6838e0cb5151796a86f4c5d7ddbcc5f2685eeb6| 2022-03-22|
|cc68407b63a9cf8b535cb9ee1332668900ad79004857bb3012bd7c4672a18979| 2022-04-09|
|67734967ddedeaf68dc1c98750ecae3dca88e19443a7d38cddb2a268fb774a1f| 2022-04-26|
|5247027a349fa3388ff298d70efaace7cc4fbe87d2db11cf704317a62cfa1f30| 2022-05-10|
|0126822588c342cc3c70db214692f390780cd97f9def116fec58a3d816f6855e| 2022-05-24|
|e9b231dadc08092010c3b516874f9d941ea73f021d832275c4ecdf277745ccb1| 2022-06-14|
|b105b2b5a03a694b46194c9eec143ac2148c19037ec52e56618b950eda76f882| 2022-06-28|
|404d732f7d90ee4728054fe98174c332e846714a9b1e085a6973cb5d881c121c| 2022-07-13|
|1b5736729d1c3c7d822aa6a0a5558c8e63bc446f769feded31aecadc1a886121| 2022-07-27|
|9abcc46a6b1dfe3c458c1d7633cf30200d62f3744be294797f8ce4d84fab3a22| 2022-08-10|
|243b918bbb3c9b9c00c02d991ea1dd08ad40f86de40224484d55f12317f2c56c| 2022-08-25|
|a6a62489aa43dec2a0dfc97bbe430defa659353379c78b7ed73fdf28e7966a18| 2022-09-07|
|43da2150436b5b4306ecb6d2c2e85b00a8854a6b62af904c74e308c874033f8f| 2022-09-24|
|e1029b68353c82172610b3947432b706d5497d1113fb19c04b8cacfafbb635a0| 2022-10-14|
|7cc98c1ed0e5d43efc1a909601f1626d87daa57ed23011f22686a40a66d4158e| 2022-10-29|
|f87e3923321bad50a1a57bfb2bcfb9af76df312df46226ddf4d39c118a9eb785| 2022-11-16|
|33342058792e502a779100abca1edc29ec258a1a50c4ff82e581003909509775| 2022-12-03|
|feb139a755127075c37b908f54fdbb61b7068190a781641c69ad8642a56c98ea| 2022-12-21|
|8dbb5570401cff5a3fc16a5ebf51059eb35d04efdc85c57fff21a72de40ced80| 2023-01-11|
|eb96811b501e3a32f72c52b8c05ee4c4ce3988c80027793377cdeff2a668bb6e| 2023-02-01|
|45d12a1afea949ff24d93b5eccba1be66174c5b24dca7f86e59da99a5a521010| 2023-02-18|
|4076aa9feef3202727b974dbfbd5300b62ee9c07206c8a5179fe2f84fbff5093| 2023-03-08|
|93ca93120a12cbdee99c08712cadf4a8819ac28bbbd77c0a291ef080857d6d77| 2023-03-21|
|982bec6e9fe9577b82a6e4750e69515434a49577b8cbc9c3a47f20bb078271a1| 2023-04-05|
|f81b6bd9c6af24d813e5e1d209dde318da3da8defbcc618a8b0a119e98a96bfd| 2023-05-03|
|d920bbfec4814e80026f617d31b520c27c59d26eb64e55b111fb6a16f7243e40| 2023-05-23|
|435138a11d3c50f7ff217c8e938b44376ef5938543702b0bd7c06cd3a4e7422c| 2023-05-25|

TIP: Put `"|" || resource.resource || "| " || resource.start_date || "|"` as your select clause to get the above.

I added the above to old-resource.csv using the select clause `resource.resource || ",410,,See old-resource.md section 2023 June 19 for details"` to generate them. It seems to match on format.

