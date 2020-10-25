# 3d Printing Guidelines

Since you may have to print some of the custom prototype components yourself, it is worth trying to do so in as
reproducible a way as possible, so that we are testing (even in the prototyping phase) with components of similar
properties. Secondarily, this should help everyone get started faster and avoid having to reinvent the wheel.

**DISLAIMER:** None of the following constitutes an endorsement of the listed products. We have done no systematic
comparative study of alternate products and have no evidence to indicate that the following are the most appropriate
for any particular purpose.

## Printers

We have been printing with SLA printers, such as:

* [Anycubic Photon](https://www.anycubic.com/collections/anycubic-photon-3d-printers/products/anycubic-photon-3d-printer)
* **TODO:** [Elegoo Mars]

## Resin

We have been using either:
* [SirayaTech Fast](https://www.amazon.com/ABS-Like-Curing-Non-Brittle-Printing-Resin/dp/B07WFJ53LP) ABS-like resin (comes in various colors)
* The above mixed with ~30% [SirayaTech Tanacious](https://www.amazon.com/Tenacious-Flexible-Resistant-Siraya-Tech/dp/B07PLJ9XW9) to mitigate brittleness

Guides for printing and curing are provided on the [manufacturer's website](https://siraya.tech/pages/support).

## Slicing

Software included with lower-end SLA printers may not be the most up-to-date. We have found it useful to scaffold and
slice the models using [ChituBox](https://www.chitubox.com/). It is available for free and runs on most operating
systems, including Linux.

The following are configuration profiles we have used in Chitubox for some of the above-mentioned printer-resin combinations:
* [Anycubic Photon & Fast resin](AnyCubic_Photon_Siraya_fast_profile.cfg)
* [Anycubic Photon & 70:30 Fast:Tenacious blend](AnyCubic_Photon_Fast7_+_tenacious3_profile.cfg)
* **TODO:** add Elegoo Mars configs

### Kind request

When you print a new part, you may customize the scaffolding which provides some improvement over the defaults. If you
have used Chitubox to do this, please save a `*.chitubox` of your intermediate object before slicing, and upload this
file to share with others. This will save everyone time and, again, improve consistency across the team. You may
also provide whatever final printer-specific files, such as `*.photon`.

Please:
* reference version of CAD model that was rendered for printing
* add any new binary file types to be tracked by [git LFS](https://github.com/RespiraWorks/Ventilator/wiki#adding-new-binary-files).
