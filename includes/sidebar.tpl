{foreach $sidebar as $item}
    <div menuItemName="{$item->getName()}" class="panel panel-sidebar {if $item->getClass()}{$item->getClass()}{else}panel-sidebar{/if}{if $item->getExtra('mobileSelect') and $item->hasChildren()} hidden-sm hidden-xs{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
        <div class="panel-heading">
            <h3 class="panel-title">
                {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                {$item->getLabel()}
                {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                <i class="fas fa-chevron-up panel-minimise pull-right"></i>
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
                        <a menuItemName="{$childItem->getName()}"
                           href="{$childItem->getUri()}"
                           class="list-group-item{if $childItem->isDisabled()} disabled{/if}{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"
                           {if $childItem->getAttribute('dataToggleTab')}
                               data-toggle="tab"
                           {/if}
                           {assign "customActionData" $childItem->getAttribute('dataCustomAction')}
                           {if is_array($customActionData)}
                               data-active="{$customActionData['active']}"
                               data-identifier="{$customActionData['identifier']}"
                               data-serviceid="{$customActionData['serviceid']}"
                           {/if}
                           {if $childItem->getAttribute('target')}
                               target="{$childItem->getAttribute('target')}"
                           {/if}
                           id="{$childItem->getId()}"
                        >
                            {if $childItem->hasBadge()}<span class="badge">{$childItem->getBadge()}</span>{/if}
                            {if is_array($customActionData)}<span class="loading" style="display: none;"><i class="fas fa-spinner fa-spin"></i></span>{/if}
                            {if $childItem->hasIcon()}<i class="{$childItem->getIcon()} sidebar-menu-item-icon"></i>{/if}
                            {$childItem->getLabel()}
                        </a>
                    {else}
                        <div menuItemName="{$childItem->getName()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                            {if $childItem->hasBadge()}<span class="badge">{$childItem->getBadge()}</span>{/if}
                            {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                            {$childItem->getLabel()}
                        </div>
                    {/if}
                {/foreach}
            </div>
        {/if}
        {if $item->hasFooterHtml()}
            <div class="panel-footer clearfix">
                {$item->getFooterHtml()}
            </div>
        {/if}
    </div>
    {if $item->getExtra('mobileSelect') and $item->hasChildren()}
        {* Mobile Select only supports dropdown menus *}
        <div class="panel hidden-lg hidden-md {if $item->getClass()}{$item->getClass()}{else}panel-default{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
            <div class="panel-heading">
                <h3 class="panel-title">
                    {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                    {$item->getLabel()}
                    {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                </h3>
            </div>
            <div class="panel-body">

                <div class="dropdown">
                    <button class="btn btn-default btn-block dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="text-align: left; display: flex; justify-content: space-between; align-items: center;">
                        {assign var="activeLabel" value="{$item->getLabel()}"}
                        {foreach $item->getChildren() as $childItem}
                            {if $childItem->isCurrent()}
                                {assign var="activeLabel" value="{$childItem->getLabel()}"}
                            {/if}
                        {/foreach}
                        {$activeLabel}
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" style="width: 100%;">
                        {foreach $item->getChildren() as $childItem}
                            <li menuItemName="{$childItem->getName()}" class="{if $childItem->isCurrent()}active{/if}">
                                <a href="{$childItem->getUri()}">
                                    {$childItem->getLabel()}
                                    {if $childItem->hasBadge()}({$childItem->getBadge()}){/if}
                                </a>
                            </li>
                        {/foreach}
                    </ul>
                </div>

            </div>
            {if $item->hasFooterHtml()}
                <div class="panel-footer">
                    {$item->getFooterHtml()}
                </div>
            {/if}
        </div>
    {/if}
{/foreach}
