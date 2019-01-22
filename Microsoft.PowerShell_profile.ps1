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
   设置控制台提示风栿
.DESCRIPTION
   设置控制台提示风格，支持五种风格：Normal，Cmd，Arrow，Simple，None
#>
Function Set-Prompt
{
    param(
    [Parameter(Mandatory=$true)]
    [ValidateSet('Normal','Cmd','Arrow','Simple', 'None',IgnoreCase = $true)]
    $Mode
    )
    $varPSPromptMode = (Get-Variable 'PSPromptMode'  -ea SilentlyContinue)
    #配置变量不存在则新建
    if ( $varPSPromptMode -eq $null)
    {
        New-Variable -Name 'PSPromptMode' -Value $Mode -Scope 'Global'
        $varPSPromptMode = Get-Variable -Name 'PSPromptMode'
        $varPSPromptMode.Description = '提示函数配置变量'
 
        #限制配置变量的取值集吿
        $varPSPromptModeAtt = New-Object System.Management.Automation.ValidateSetAttribute('Normal','Cmd','Arrow','Simple','None')
        $varPSPromptMode.Attributes.Add($varPSPromptModeAtt)
 
        #限制配置变量为只读并且可以贯穿所有作用域ls
        $varPSPromptMode.Options = 'ReadOnly, AllScope'
 
    }
    #更新配置
    #只读变量可以通过-force选项更新倿
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