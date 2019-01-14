$web = New-Object Net.HttpListener
$web.Prefixes.Add("http://+:9999/")
$web.Start()
while ($web.IsListening) {
	$gc = $web.GetContext()
	$resp = $gc.Response
	$resp.Headers.Add("Content-Type","application/octet-stream")
	$buf = [Text.Encoding]::UTF8.GetBytes((gc C:\file.txt))
	$resp.ContentLength64 = $buf.Length
	$resp.OutputStream.Write($buf,0,$buf.Length)
	$resp.Close()
}
$web.Stop()