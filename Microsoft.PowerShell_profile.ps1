Function Prompt()
{
    # get current path
    $path = Get-Location

    # set title text
    $host.UI.RawUI.WindowTitle = "$path"

    switch ($PSPromptMode)
    {
        'Cmd'
        {
          "$($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "
        }
 
        'Arrow'
        {
          '> '
        }
 
        'None'
        {
          ' '
        }
        'Simple'
        {
         'PS> '
        }
        Default
        {
         "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "
        }
    }
}
 
<#
.Synopsis
   ���ÿ���̨��ʾ���
.DESCRIPTION
   ���ÿ���̨��ʾ���֧�����ַ��Normal��Cmd��Arrow��Simple��None
#>
Function Set-Prompt
{
    param(
    [Parameter(Mandatory=$true)]
    [ValidateSet('Normal','Cmd','Arrow','Simple', 'None',IgnoreCase = $true)]
    $Mode
    )
    $varPSPromptMode = (Get-Variable 'PSPromptMode'  -ea SilentlyContinue)
    #���ñ������������½�
    if ( $varPSPromptMode -eq $null)
    {
        New-Variable -Name 'PSPromptMode' -Value $Mode -Scope 'Global'
        $varPSPromptMode = Get-Variable -Name 'PSPromptMode'
        $varPSPromptMode.Description = '��ʾ�������ñ���'
 
        #�������ñ�����ȡֵ����
        $varPSPromptModeAtt = New-Object System.Management.Automation.ValidateSetAttribute('Normal','Cmd','Arrow','Simple','None')
        $varPSPromptMode.Attributes.Add($varPSPromptModeAtt)
 
        #�������ñ���Ϊֻ�����ҿ��Թᴩ����������ls
        $varPSPromptMode.Options = 'ReadOnly, AllScope'
 
    }
    #��������
    #ֻ����������ͨ��-forceѡ�����
    Set-Variable -Name PSPromptMode -Value $Mode -Force
}

Function svv($k, $v, $flag=0)
{
	$tmp = [System.Environment]::GetEnvironmentVariable($k, "User")
	
	if (!($tmp).contains($v))
	{
		$tmp = $tmp + ";" + $v
		
		# ${env:$k} = $tmp
		
		[System.Environment]::SetEnvironmentVariable($k, $tmp, "User")
	}
	
	if (($tmp).contains($v))
	{
		if (1 -eq $flag)
		{
			$tmp = ($tmp).Replace(";" + $v, "")
		
			[System.Environment]::SetEnvironmentVariable($k, $tmp, "User")
		}
	}
}

$ret = Set-Prompt Arrow
$ret = prompt