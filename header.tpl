<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>

    {include file="$template/includes/head.tpl"}

    {$headoutput}

</head>
<body data-phone-cc-input="{$phoneNumberInputStyle}">

{$headeroutput}

<section id="main-menu">
    <nav id="nav" class="navbar navbar-default navbar-main" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#primary-nav">
                    <span class="sr-only">{lang key='toggleNav'}</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                {if $assetLogoPath}
                    <a href="{$WEB_ROOT}/index.php" class="navbar-brand"><img src="{$assetLogoPath}" alt="{$companyname}"></a>
                {else}
                    <a href="{$WEB_ROOT}/index.php" class="navbar-brand logo-text">{$companyname}</a>
                {/if}
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="primary-nav">

                <ul class="nav navbar-nav">
                    {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar}
                    
                    {* Notifications *}
                    {if $loggedin}
                         <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fas fa-bell"></i>
                                {if count($clientAlerts) > 0}
                                    <span class="label label-info">{lang key='notificationsnew'}</span>
                                {/if}
                            </a>
                            <ul class="dropdown-menu text-left">
                                {foreach $clientAlerts as $alert}
                                    <li>
                                        <a href="{$alert->getLink()}">
                                            <div class="message">{$alert->getMessage()}</div>
                                        </a>
                                    </li>
                                {foreachelse}
                                    <li class="none">
                                        <a href="#">{$LANG.notificationsnone}</a>
                                    </li>
                                {/foreach}
                            </ul>
                        </li>
                    {else}
                        <li>
                            <a href="{$WEB_ROOT}/cart.php?a=view">
                                <i class="fas fa-shopping-cart"></i>
                            </a>
                        </li>
                    {/if}

                    {* Language *}
                    {if $languagechangeenabled && count($locales) > 1}
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fas fa-language"></i>
                            </a>
                            <ul class="dropdown-menu">
                                {foreach $locales as $locale}
                                    <li>
                                        <a href="{$currentpagelinkback}language={$locale.language}">{$locale.localisedName}</a>
                                    </li>
                                {/foreach}
                            </ul>
                        </li>
                    {/if}
                </ul>

            </div><!-- /.navbar-collapse -->
        </div>
    </nav>
</section>

{if $templatefile == 'homepage'}
    <section id="home-banner" class="text-center">
        <div class="container">
            {if $registerdomainenabled || $transferdomainenabled}
                <h2 class="text-slate-50">{$LANG.homebegin}</h2>
                <form method="post" action="domainchecker.php" id="frmDomainHomepage">
                    <input type="hidden" name="transfer" />
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                            <div class="input-group input-group-lg">
                                <input type="text" class="form-control" name="domain" placeholder="{$LANG.exampledomain}" autocapitalize="none" />
                                <span class="input-group-btn">
                                    {if $registerdomainenabled}
                                        <input type="submit" class="btn btn-primary search" value="{$LANG.search}" id="btnDomainSearch" />
                                    {/if}
                                    {if $transferdomainenabled}
                                        <input type="submit" id="btnTransfer" class="btn btn-default transfer" value="{$LANG.domainstransfer}" />
                                    {/if}
                                </span>
                            </div>
                        </div>
                    </div>
                    {include file="$template/includes/captcha.tpl"}
                </form>
            {else}
                <h2 class="text-slate-50">{$LANG.doToday}</h2>
            {/if}
        </div>
    </section>
{/if}

{include file="$template/includes/validateuser.tpl"}
{include file="$template/includes/verifyemail.tpl"}

<section id="main-body">
    <div class="container{if $skipMainBodyContainer}-fluid without-padding{/if}">
        <div class="row">

        {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
            {if $primarySidebar->hasChildren() && !$skipMainBodyContainer}
                <div class="col-md-9 pull-md-right">
                    {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
                </div>
            {/if}
            <div class="col-md-3 pull-md-left sidebar">
                {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
            </div>
        {/if}
        <!-- Container for main page display content -->
        <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-md-9 pull-md-right{else}col-xs-12{/if} main-content">
            {if !$primarySidebar->hasChildren() && !$showingLoginPage && !$inShoppingCart && $templatefile != 'homepage' && !$skipMainBodyContainer}
                {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
            {/if}
