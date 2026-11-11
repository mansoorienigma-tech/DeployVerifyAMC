# DeployVerifyAMC — استقرار و راستی‌آزمایی طبقه‌بندی مدولاسیون روی RFSoC

این پروژه، شبکهٔ عصبی (CNN) طبقه‌بندی مدولاسیون را که در MATLAB ساخته شده، به‌صورت یک IP پردازندهٔ یادگیری عمیق (`GenericProcessor`) روی برد **AMD Zynq UltraScale+ RFSoC ZCU111** مستقر می‌کند و در کنار آن، ساب‌سیستم RF (RFDC + DDR + DMA) را در Vivado می‌سازد.

> **نسخهٔ هدف: Vivado 2023.2** — همهٔ IPها و فایل‌های پروژه با 2023.2 سازگارند (جزئیات در بخش «بررسی سازگاری نسخه»).

---

## ۱) پیش‌نیازها

| ابزار | نسخه / توضیح |
|---|---|
| Vivado | **2023.2** (64-bit) + لایسنس Synthesis برای `xczu28dr` |
| MATLAB | نسخه‌ای که IP هوش مصنوعی با آن ساخته شده + جعبه‌ابزارهای Deep Learning Toolbox، HDL Coder و SoC Blockset |
| سخت‌افزار | برد ZCU111 (برای تست روی برد واقعی) |
| بردفایل ZCU111 | در Vivado نصب باشد (`xilinx.com:zcu111:part0:1.2`) |

---

## ۲) بررسی سازگاری نسخه (انجام شد)

همهٔ موارد زیر بررسی شد و **سازگار با Vivado 2023.2** هستند:

- هر ۱۰۷ فایل `.xci` → `SWVERSION = 2023.2`
- هر ۹ فایل `.xpr` → `Product Version: Vivado v2023.2`
- هر ۳ فایل `.bd` → `tool_version = 2023.2` و `validated = true`
- `GenericProcessor` (`component.xml`) → `xilinxVersion = 2023.2`
- `ipcore/tclutils/add_system.tcl` → `scripts_vivado_version 2023.2` ✅

⚠️ **نکته:** فایل `add_system_original_backup.tcl` در ریشهٔ ریپو نسخهٔ **اصلی 2024.1** است و **در روند ساخت استفاده نمی‌شود**. فایل مورد استفاده، `AMCMatlab/hdl/vivado_ip_prj/ipcore/tclutils/add_system.tcl` است (2023.2). اگر آن فایل بکاپ را source کنید، خطای `BD::TCL 103-2041` برمی‌گردد.

---

## ۳) روش اجرا — حالت Batch بدون GUI (توصیه‌شده) ✅

**مشکل «بخاطر گرافیک Vivado بسته می‌شود»** به‌احتمال زیاد کرش GUI به‌خاطر درایور گرافیک/OpenGL ویندوز است، نه خرابی پروژه. راه‌حل قطعی: ساخت را در حالت **Batch (بدون باز شدن GUI)** انجام دهید.

### الف) ساخت کامل سیستم (ساب‌سیستم + RFDC + DDR + آی‌پی هوش مصنوعی)

در پوشهٔ `AMCMatlab/hdl/vivado_ip_prj` روی `run_build.bat` دابل‌کلیک کنید، یا در Command Prompt:

```bat
cd AMCMatlab\hdl\vivado_ip_prj
C:\Xilinx\Vivado\2023.2\bin\vivado.bat -mode batch -notrace -source vivado_create_prj.tcl
```

این دستور کل بلاک‌دیزاین `system` را از روی Tcl می‌سازد و در انتها پروژه را ذخیره می‌کند. هیچ پنجرهٔ گرافیکی باز نمی‌شود، پس کرش گرافیکی رخ نمی‌دهد.

### ب) بررسی سریع سلامت پروژه (بدون سنتز، در چند ثانیه)

```bat
C:\Xilinx\Vivado\2023.2\bin\vivado.bat -mode batch -notrace -source verify_project.tcl
```

این اسکریپت پروژه را باز می‌کند، `system.bd` را validate می‌کند، وجود آی‌پی `GenericProcessor` را در کاتالوگ چک می‌کند و گزارش `ip_status.rpt` می‌سازد. اگر خروجی `OK: system.bd validated` را دیدید، پروژه سالم است.

### د) سنتز و ساخت بیت‌استریم (بعد از ساخت بلاک‌دیزاین)

```bat
run_synth.bat
```

این مرحله سنتز (`synth_1`) و پیاده‌سازی (`impl_1`) را اجرا می‌کند و فایل بیت‌استریم را در `vivado_prj.runs/impl_1` می‌سازد. ⚠️ روی کامپیوتر ضعیف چند ساعت طول می‌کشد و RAM زیادی می‌خواهد — وقتی وقت داری اجرا کن.

**گزارش خودکار:** در پایان، `send_report.bat` بهصورت خودکار اجرا میشود. این اسکریپت یک خلاصه کوچک از `vivado.log` (خطاها، علت قفل شدن دیزاین، وضعیت سنتز) در فایل `synth_report.txt` میسازد و آن را **خودکار به گیت هاب push میکند**. نیازی به اسکرینشات یا کپی دستی نیست — فقط کافی است بگویید «گزارش پوش شد».

اگر خواستید گزارش همان اجرای قبلی را بدون اجرای دوباره سنتز بفرستید، کافی است روی `send_report.bat` دابلکلیک کنید. هر اجرا یک کامیت کوچک میسازد، پس نسخههای قبلی report در History میمانند.

### ج) باز کردن در GUI (اختیاری)

بعد از ساخت موفق در حالت Batch، فایل `AMCMatlab/hdl/vivado_ip_prj/vivado_prj.xpr` را در Vivado 2023.2 باز کنید. بلاک‌دیزاین `system` شامل حدود ۹۰ IP است و روی سیستم‌های ضعیف سنگین است؛ اگر GUI کند/کرش کرد، بخش ۵ را ببینید.

> **نکتهٔ مهم:** آی‌پی هوش مصنوعی (`dlprocessor_0`) **از قبل** داخل `system.bd` قرار گرفته و به ساب‌سیستم وصل است (از طریق `axi_interconnect_dlproc` و حافظهٔ DDR). نیازی نیست آن را دستی کنار IPهای ساب‌سیستم اضافه کنید — فقط کافی است پروژه را باز کنید یا با روش (الف) بسازید.

---

## ۴) ساخت آی‌پی هوش مصنوعی در MATLAB (در صورت نیاز به بازسازی)

اگر خواستید IP را از نو بسازید، در MATLAB فایل `matlab code for vivido ip/untitled.m` را اجرا کنید. این اسکریپت:

1. مسیر Vivado 2023.2 را تنظیم می‌کند (`hdlsetuptoolpath`).
2. `dlhdl.ProcessorConfig` را با `TargetPlatform = 'Generic Deep Learning Processor'` می‌سازد.
3. با `dlhdl.buildProcessor` آی‌پی `GenericProcessor` را در پوشهٔ `genericipcore` تولید می‌کند.

خروجی در `matlab code for vivido ip/genericipcore/ipcore/GenericProcessor_v1_0` قرار می‌گیرد و اسکریپت `vivado_create_prj.tcl` به‌صورت خودکار آن را پیدا می‌کند (مسیر نسبی — روی هر کامپیوتری کار می‌کند).

---

## ۵) عیب‌یابی

| مشکل | علت و راه‌حل |
|---|---|
| `ERROR: [BD::TCL 103-2041] This script was generated using Vivado <2024.1>...` | فایل بکاپ 2024.1 را source کرده‌اید. از `ipcore/tclutils/add_system.tcl` (نسخهٔ 2023.2) استفاده کنید. |
| Vivado در حالت GUI بسته می‌شود / ارور گرافیکی | کرش درایور GPU. راه‌حل اصلی: **حالت Batch** (بخش ۳). برای GUI: درایور گرافیک را به‌روز کنید، پوشهٔ `%APPDATA%\Xilinx` را پاک کنید و دوباره امتحان کنید، و ویوهای غیرضروری (مثلاً Waveform) را ببندید. |
| `WARNING: [Board 49-91] Board repository path ... does not exist` | مسیر مطلق قدیمی بردفایل در `.xpr` بود — **رفع شد**. اگر باز هم دیدید، بردفایل ZCU111 را در Vivado نصب کنید. |
| `ERROR: [Common 17-55] 'set_property' expects at least one object` + `No files matched 'system.bd'` | اسکریپت قبل از ساختن دیزاین متوقف شده (معمولاً همان خطای نسخه). اول خطای نسخه را رفع کنید. |
| خطای مسیر `E:/AMC_Projects/...` | مسیر مطلق قدیمی بود — **رفع شد**؛ حالا مسیرها نسبی هستند و روی هر کامپیوتر کار می‌کنند. |
| `ERROR: [BD 41-1665] Unable to generate top-level wrapper HDL ... is locked` + `module 'system_wrapper' not found` | بلاکدیزاین ذخیرهشده شامل IPهای قفلشده است (`Locked reason: BD contains locked IPs`)، پس `make_wrapper` روی پروژه بازشده جواب نمیدهد — **رفع شد**: wrapper حالا همان موقع ساخت BD (در `run_build.bat`) ساخته میشود، جایی که IPها تازه و بدون قفلاند. `run_synth.bat` هم اگر wrapper نباشد خودش پروژه را میسازد. |
| `ERROR: [Common 17-53] Top module not set for synthesis run` | تاپ ماژول `system_wrapper` تنظیم نشده بود — **رفع شد**. |

---

## ۶) ساختار پوشه‌ها

```
AMCMatlab/
  ModulationClassificationDeploymentOnRFSoCDevicesExample.m  ← مثال مرجع MathWorks
  hdl/
    soc_dlmc_rfsoc_zcu111_rfdc_setup.m                        ← تنظیم RFDC روی برد
    vivado_ip_prj/                                           ← پروژهٔ اصلی Vivado (system)
      vivado_create_prj.tcl                                  ← اسکریپت ساخت Batch
      run_build.bat                                          ← اجرای یک‌کلیکی در ویندوز
      run_synth.bat                                         ← سنتز، بیتاستریم و ارسال خودکار گزارش
      send_report.bat                                       ← ساخت و push خلاصه لاگ (بدون سنتز)
      verify_project.tcl                                     ← بررسی سلامت بدون GUI
      vivado_prj.xpr                                         ← پروژهٔ Vivado 2023.2
      ipcore/tclutils/add_system.tcl                         ← Tcl ساب‌سیستم (2023.2)
matlab code for vivido ip/
  untitled.m                                                 ← ساخت آی‌پی در MATLAB
  genericipcore/ipcore/GenericProcessor_v1_0                 ← آی‌پی هوش مصنوعی
deep_learning_ip/                                            ← پروژهٔ مستقل تست آی‌پی
add_system_original_backup.tcl                               ← بکاپ اصلی (2024.1) — استفاده نمی‌شود
```

---

## ۷) تغییرات این برنچ

- `vivado_create_prj.tcl`: **wrapper سطح بالا (`system_wrapper`) را همان موقع ساخت BD تولید میکند** تا سنتز به خطای IP قفلشده نخورد.
- `run_synth.tcl`: بهجای `make_wrapper` روی پروژه ذخیرهشده، وجود wrapper را بررسی میکند؛ در صورت نبود، مسیر IP repo را تازه میکند، IPهای قفلشده را `upgrade_ip` میکند و سرانجام پیام روشنی میدهد.
- `vivado_create_prj.tcl`: مسیر مطلق `E:/...` حذف و نسبی شد؛ اجرای مستقل از پوشهٔ فعلی؛ محافظت از خطاهای بردفایل؛ حذف `exit` انتهای اسکریپت (که در کنسول GUI باعث بسته‌شدن Vivado می‌شد).
- `verify_project.tcl` و `run_build.bat`: اضافه شد (بررسی و ساخت بدون GUI).
- `vivado_prj.xpr` و `deep_learning_ip.xpr`: مسیرهای مطلق قدیمی (`C:/Users/admin/...`) حذف شد.
- `.gitignore`: خروجی‌های تولیدی Vivado (`*.gen`, `*.cache`, `*.runs`, ...) نادیده گرفته شد.
- `send_report.bat`: خلاصه کوچک `vivado.log` را در `synth_report.txt` مینویسد و خودکار push میکند؛ نیازی به اسکرینشات یا کپی دستی نیست.
