# Prompt the user for the target website and the location of the text file
$targetWebsite = Read-Host "Enter the target website (e.g. https://www.example.com): "
$proxyFile = Read-Host "Enter the location of the text file containing the list of proxies: "

# Read the list of proxies from the text file
$proxies = Get-Content $proxyFile

# Set the initial visit count to 0
$visitCount = 0
$failedCount = 0

# Set an infinite loop to send requests to the website every 5 seconds
while ($true) {
  # Select a proxy from the list at random
  $proxy = $proxies | Get-Random

  # Create a WebRequest object using the selected proxy
  $request = [System.Net.WebRequest]::Create($targetWebsite)
  $request.Proxy = New-Object System.Net.WebProxy($proxy)

  # Send the request and get the response
  try {
    $response = $request.GetResponse()

    # Increment the visit count if the request was successful (status code 200)
    if ($response.StatusCode -eq 200) {
      $visitCount++
      $currentTime = Get-Date -Format "HH:mm:ss"
      Write-Host "OK - Visit Count $visitCount - Time: $currentTime"
    }
    else {
      $currentTime = Get-Date -Format "HH:mm:ss"
      Write-Host "Failed - Visit Count $visitCount - Time: $currentTime"
    }

    # Close the response stream
    $response.Close()
  } catch {
    # Increment the failed count if the request failed
    $failedCount++
    $currentTime = Get-Date -Format "HH:mm:ss"
    Write-Host "Failed to connect using proxy $proxy - Failed Count $failedCount - Time: $currentTime"
  }

  # Wait for 5 seconds before sending the next request
  Start-Sleep -Seconds 5
}
