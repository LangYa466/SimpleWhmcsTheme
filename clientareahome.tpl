{include file="$template/includes/flashmessage.tpl"}

<div class="stats-overview clearfix">
    <div class="row">
        <div class="col-md-3 col-sm-6">
            <a href="clientarea.php?action=services" class="stat-card">
                <div class="stat-card-icon">
                    <i class="fas fa-cube"></i>
                </div>
                <div class="stat-card-content">
                    <span class="stat-card-value">{$clientsstats.productsnumactive}</span>
                    <span class="stat-card-label">{$LANG.navservices}</span>
                </div>
            </a>
        </div>
        
        {if $clientsstats.numdomains || $registerdomainenabled || $transferdomainenabled}
        <div class="col-md-3 col-sm-6">
            <a href="clientarea.php?action=domains" class="stat-card">
                <div class="stat-card-icon">
                    <i class="fas fa-globe"></i>
                </div>
                <div class="stat-card-content">
                    <span class="stat-card-value">{$clientsstats.numactivedomains}</span>
                    <span class="stat-card-label">{$LANG.navdomains}</span>
                </div>
            </a>
        </div>
        {elseif $condlinks.affiliates && $clientsstats.isAffiliate}
        <div class="col-md-3 col-sm-6">
            <a href="affiliates.php" class="stat-card">
                <div class="stat-card-icon">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <div class="stat-card-content">
                    <span class="stat-card-value">{$clientsstats.numaffiliatesignups}</span>
                    <span class="stat-card-label">{$LANG.affiliatessignups}</span>
                </div>
            </a>
        </div>
        {else}
        <div class="col-md-3 col-sm-6">
            <a href="clientarea.php?action=quotes" class="stat-card">
                <div class="stat-card-icon">
                    <i class="far fa-file-alt"></i>
                </div>
                <div class="stat-card-content">
                    <span class="stat-card-value">{$clientsstats.numquotes}</span>
                    <span class="stat-card-label">{$LANG.quotes}</span>
                </div>
            </a>
        </div>
        {/if}

        <div class="col-md-3 col-sm-6">
            <a href="supporttickets.php" class="stat-card">
                <div class="stat-card-icon">
                    <i class="fas fa-comments"></i>
                </div>
                <div class="stat-card-content">
                    <span class="stat-card-value">{$clientsstats.numactivetickets}</span>
                    <span class="stat-card-label">{$LANG.navtickets}</span>
                </div>
            </a>
        </div>

        <div class="col-md-3 col-sm-6">
            <a href="clientarea.php?action=invoices" class="stat-card">
                <div class="stat-card-icon">
                    <i class="fas fa-credit-card"></i>
                </div>
                <div class="stat-card-content">
                    <span class="stat-card-value">{$clientsstats.numunpaidinvoices}</span>
                    <span class="stat-card-label">{$LANG.navinvoices}</span>
                </div>
            </a>
        </div>
    </div>
</div>

<form role="form" method="post" action="clientarea.php?action=kbsearch">
    <div class="row">
        <div class="col-md-12 home-kb-search">
            <input type="text" name="search" class="form-control input-lg" placeholder="{$LANG.clientHomeSearchKb}" />
            <i class="fas fa-search"></i>
        </div>
    </div>
</form>

{foreach from=$addons_html item=addon_html}
    <div>
        {$addon_html}
    </div>
{/foreach}

<div class="client-home-panels">
    <div class="row">
        <div class="col-sm-12">

            {function name=outputHomePanels}
                <div menuItemName="{$item->getName()}" class="panel panel-default panel-accent-{$item->getExtra('color')}{if $item->getClass()} {$item->getClass()}{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                                <div class="pull-right">
                                    <a href="{$item->getExtra('btn-link')}" class="btn btn-default bg-color-{$item->getExtra('color')} btn-xs">
                                        {if $item->getExtra('btn-icon')}<i class="{$item->getExtra('btn-icon')}"></i>{/if}
                                        {$item->getExtra('btn-text')}
                                    </a>
                                </div>
                            {/if}
                            {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                            {$item->getLabel()}
                            {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                        </h3>
                    </div>
                    {if $item->hasBodyHtml()}
                        <div class="panel-body">
                            {$item->getBodyHtml()}
                        </div>
                    {/if}
                    {if $item->hasChildren()}
                        <div class="list-group{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}">
                            {foreach $item->getChildren() as $childItem}
                                {if $childItem->getUri()}
                                    <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                                    </a>
                                {else}
                                    <div menuItemName="{$childItem->getName()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    {/if}
                    <div class="panel-footer">
                        {if $item->hasFooterHtml()}
                            {$item->getFooterHtml()}
                        {/if}
                    </div>
                </div>
            {/function}

            {foreach $panels as $item}
                {if $item->getExtra('colspan')}
                    {outputHomePanels}
                    {assign "panels" $panels->removeChild($item->getName())}
                {/if}
            {/foreach}

        </div>
        <div class="col-sm-6">

            {foreach $panels as $item}
                {if $item@iteration is odd}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
        <div class="col-sm-6">

            {foreach $panels as $item}
                {if $item@iteration is even}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
    </div>
</div>
